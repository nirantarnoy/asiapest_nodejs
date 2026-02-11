const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        let countQuery = db('complain as c')
            .leftJoin('customer as cust', 'c.customer_id', 'cust.id');

        let query = db('complain as c')
            .leftJoin('customer as cust', 'c.customer_id', 'cust.id')
            .select('c.*', 'cust.name as customer_name')
            .orderBy('c.id', 'desc');

        if (search) {
            query.where(builder => {
                builder.where('c.complain_no', 'like', `%${search}%`)
                    .orWhere('cust.name', 'like', `%${search}%`)
                    .orWhere('c.description', 'like', `%${search}%`);
            });
            countQuery.where(builder => {
                builder.where('c.complain_no', 'like', `%${search}%`)
                    .orWhere('cust.name', 'like', `%${search}%`)
                    .orWhere('c.description', 'like', `%${search}%`);
            });
        }

        const totalQuery = await countQuery.count('c.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('complain/index', {
            items,
            pagination: { page, limit: limit || 'all', total, totalPages },
            search
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = async (req, res) => {
    try {
        const customers = await db('customer').select('id', 'name');
        const products = await db('product').select('id', 'name', 'code');
        res.render('complain/create', { customers, products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const {
        complain_date, customer_id, description, problem,
        problem_cause, taken_action, status,
        line_product_id, line_product_qty,
        track_date, track_note
    } = req.body;

    const trx = await db.transaction();
    try {
        // Generate Complain No
        const prefix = 'CP-' + new Date().getFullYear().toString().substr(2, 2);
        const last = await trx('complain').where('complain_no', 'like', `${prefix}%`).orderBy('complain_no', 'desc').first();
        let nextNum = 1;
        if (last && last.complain_no) {
            const numPart = last.complain_no.split('-')[1];
            if (numPart) {
                const num = parseInt(numPart.substring(2)); // SV-2600001 -> SV-26 is prefix? No, CP-YYXXXXX
                // Let's check CP-2400001
                const n = parseInt(numPart.substring(2));
                if (!isNaN(n)) nextNum = n + 1;
            }
        }
        // Actually the PHP logic for getLastNo might be different. Let's use a standard one.
        const complainNo = prefix + nextNum.toString().padStart(5, '0');

        const [complainId] = await trx('complain').insert({
            complain_no: complainNo,
            complain_date: complain_date || null,
            customer_id: customer_id || null,
            description,
            problem,
            problem_cause,
            taken_action,
            status: status || 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        // 1. Issue Equipment
        if (line_product_id && Array.isArray(line_product_id)) {
            const validLines = line_product_id.filter((id, i) => id && line_product_qty[i] > 0);
            if (validLines.length > 0) {
                const journalNo = await generateJournalIssueNo(trx);
                const [journalId] = await trx('journal_issue').insert({
                    journal_issue_no: journalNo,
                    trans_date: new Date(),
                    trans_ref_id: complainId,
                    trans_ref_type: 3, // Issue_complain
                    status: 1,
                    created_by: req.session.user.id,
                    created_at: Math.floor(Date.now() / 1000)
                });

                const journalLines = [];
                for (let i = 0; i < line_product_id.length; i++) {
                    if (line_product_id[i] && line_product_qty[i] > 0) {
                        journalLines.push({
                            journal_issue_id: journalId,
                            product_id: line_product_id[i],
                            qty: line_product_qty[i]
                        });
                    }
                }
                if (journalLines.length > 0) {
                    await trx('journal_issue_line').insert(journalLines);
                }
            }
        }

        // 2. Complain Track
        if (track_date && Array.isArray(track_date)) {
            const trackLines = [];
            for (let i = 0; i < track_date.length; i++) {
                if (track_date[i]) {
                    trackLines.push({
                        complain_id: complainId,
                        track_date: track_date[i],
                        note: track_note[i]
                    });
                }
            }
            if (trackLines.length > 0) {
                await trx('complain_track').insert(trackLines);
            }
        }

        await trx.commit();
        res.redirect('/complain');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating complaint: ' + err.message);
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('complain').where({ id }).first();
        if (!item) return res.status(404).send('Complaint not found');

        const customers = await db('customer').select('id', 'name');
        const products = await db('product').select('id', 'name', 'code');

        // Tracking lines
        const trackLines = await db('complain_track').where({ complain_id: id });

        // Issue lines (from most recent journal issue for this complaint)
        const journalIssue = await db('journal_issue').where({ trans_ref_id: id, trans_ref_type: 3 }).orderBy('id', 'desc').first();
        let issueLines = [];
        if (journalIssue) {
            issueLines = await db('journal_issue_line as jl')
                .leftJoin('product as p', 'jl.product_id', 'p.id')
                .select('jl.*', 'p.name as product_name', 'p.code as product_code')
                .where({ journal_issue_id: journalIssue.id });
        }

        res.render('complain/edit', { item, customers, products, trackLines, issueLines, journalIssue });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const {
        complain_date, customer_id, description, problem,
        problem_cause, taken_action, status,
        line_product_id, line_product_qty,
        track_id, track_date, track_note,
        remove_track_list // array of IDs to remove
    } = req.body;

    const trx = await db.transaction();
    try {
        await trx('complain').where({ id }).update({
            complain_date: complain_date || null,
            customer_id: customer_id || null,
            description,
            problem,
            problem_cause,
            taken_action,
            status: status || 1,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        // 1. Issue Equipment (Simplified: if any positive qty, create/update journal issue)
        // Check if we should update or create new. PHP seems to create new or has complex logic.
        // Let's check for an existing journal issue for this complain
        let journalIssue = await trx('journal_issue').where({ trans_ref_id: id, trans_ref_type: 3 }).orderBy('id', 'desc').first();

        if (line_product_id && Array.isArray(line_product_id)) {
            const hasQty = line_product_qty.some(q => parseFloat(q) > 0);
            if (hasQty) {
                if (!journalIssue) {
                    const journalNo = await generateJournalIssueNo(trx);
                    const [newJournalId] = await trx('journal_issue').insert({
                        journal_issue_no: journalNo,
                        trans_date: new Date(),
                        trans_ref_id: id,
                        trans_ref_type: 3,
                        status: 1,
                        created_by: req.session.user.id,
                        created_at: Math.floor(Date.now() / 1000)
                    });
                    journalIssue = { id: newJournalId };
                } else {
                    // Clear old lines and re-insert or update? 
                    // Common practice in this app seems to be delete and re-insert for line items
                    await trx('journal_issue_line').where({ journal_issue_id: journalIssue.id }).delete();
                }

                const journalLines = [];
                for (let i = 0; i < line_product_id.length; i++) {
                    if (line_product_id[i] && line_product_qty[i] > 0) {
                        journalLines.push({
                            journal_issue_id: journalIssue.id,
                            product_id: line_product_id[i],
                            qty: line_product_qty[i]
                        });
                    }
                }
                if (journalLines.length > 0) {
                    await trx('journal_issue_line').insert(journalLines);
                }
            }
        }

        // 2. Tracking Lines
        if (remove_track_list) {
            const toRemove = Array.isArray(remove_track_list) ? remove_track_list : [remove_track_list];
            await trx('complain_track').whereIn('id', toRemove).delete();
        }

        if (track_date && Array.isArray(track_date)) {
            for (let i = 0; i < track_date.length; i++) {
                if (track_date[i]) {
                    const data = {
                        complain_id: id,
                        track_date: track_date[i],
                        note: track_note[i]
                    };
                    if (track_id && track_id[i]) {
                        await trx('complain_track').where({ id: track_id[i] }).update(data);
                    } else {
                        await trx('complain_track').insert(data);
                    }
                }
            }
        }

        await trx.commit();
        res.redirect('/complain');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating complaint');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('complain_track').where({ complain_id: id }).delete();
        // Also might need to handle journal issues, but usually we just delete the main record if linked
        await trx('complain').where({ id }).delete();
        await trx.commit();
        res.redirect('/complain');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting complaint');
    }
};

async function generateJournalIssueNo(trx) {
    const date = new Date();
    const prefix = 'JI' + date.getFullYear().toString().substr(2, 2) + (date.getMonth() + 1).toString().padStart(2, '0');
    const last = await trx('journal_issue').where('journal_issue_no', 'like', `${prefix}%`).orderBy('journal_issue_no', 'desc').first();
    let nextNum = 1;
    if (last && last.journal_issue_no) {
        const numPart = last.journal_issue_no.substring(6);
        const n = parseInt(numPart);
        if (!isNaN(n)) nextNum = n + 1;
    }
    return prefix + nextNum.toString().padStart(4, '0');
}
