const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('journal_issue as ji')
            .leftJoin('user as u', 'ji.created_by', 'u.id');

        let query = db('journal_issue as ji')
            .leftJoin('user as u', 'ji.created_by', 'u.id')
            .select('ji.*', 'u.username as created_by_name')
            .orderBy('ji.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('ji.journal_issue_no', 'like', `%${search}%`)
                    .orWhere('ji.reason', 'like', `%${search}%`)
                    .orWhere('u.username', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('ji.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('journal-issue/index', {
            items,
            pagination: {
                page,
                limit: limit || 'all',
                total,
                totalPages
            },
            search
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = async (req, res) => {
    try {
        const products = await db('product').select('id', 'code', 'name');
        res.render('journal-issue/create', { products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { issue_date, note, lines } = req.body;
    const trx = await db.transaction();
    try {
        const lastNo = await generateIssueNo(trx);
        const [id] = await trx('journal_issue').insert({
            journal_issue_no: lastNo,
            trans_date: issue_date || new Date().toISOString().split('T')[0],
            reason: note,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                journal_issue_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: 0,
                note: ''
            }));

            if (lineData.length > 0) {
                await trx('journal_issue_line').insert(lineData);

                // Update Stock
                for (const line of lineData) {
                    const qty = parseFloat(line.qty);
                    if (qty > 0) {
                        // 1. Stock Trans
                        await trx('stock_trans').insert({
                            trans_no: await generateStockTransNo(trx, 2), // 2 = OUT
                            trans_date: new Date(),
                            product_id: line.product_id,
                            qty: qty,
                            ref_id: id,
                            trans_module_id: 3, // 3 = Issue
                            trans_stock_type: 2, // 2 = OUT
                            created_at: Math.floor(Date.now() / 1000)
                        });

                        // 2. Update Stock Sum
                        const exist = await trx('stock_sum').where({ product_id: line.product_id }).first();
                        if (exist) {
                            await trx('stock_sum').where({ product_id: line.product_id }).update({
                                qty: exist.qty - qty
                            });
                        } else {
                            await trx('stock_sum').insert({
                                product_id: line.product_id,
                                qty: -qty,
                                warehouse_id: 1,
                                location_id: 1,
                                status: 1
                            });
                        }
                    }
                }
            }
        }

        await trx.commit();
        res.redirect('/journal-issue');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating Issue: ' + err.message);
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        const lines = await trx('journal_issue_line').where({ journal_issue_id: id });
        for (const line of lines) {
            const exist = await trx('stock_sum').where({ product_id: line.product_id }).first();
            if (exist) {
                await trx('stock_sum').where({ product_id: line.product_id }).update({
                    qty: exist.qty + line.qty
                });
            }
            await trx('stock_trans').where({ ref_id: id, trans_module_id: 3 }).delete();
        }

        await trx('journal_issue_line').where({ journal_issue_id: id }).delete();
        await trx('journal_issue').where({ id }).delete();
        await trx.commit();
        res.redirect('/journal-issue');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting Issue');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('journal_issue as ji')
            .leftJoin('user as u', 'ji.created_by', 'u.id')
            .select('ji.*', 'u.username as creator_fname') // fallback to username
            .where('ji.id', id)
            .first();

        const lines = await db('journal_issue_line as jil')
            .leftJoin('product as p', 'jil.product_id', 'p.id')
            .select('jil.*', 'p.code as product_code', 'p.name as product_name', 'p.description as details')
            .where({ journal_issue_id: id });

        const company = await db('company').first();

        res.render('journal-issue/print', { item, lines, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Print Error');
    }
};

async function generateIssueNo(trx) {
    const date = new Date();
    const prefix = 'IS-' + date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
    // Using journal_issue_no column
    const last = await trx('journal_issue').where('journal_issue_no', 'like', prefix + '%').orderBy('journal_issue_no', 'desc').first();
    if (last) {
        // journal_issue_no format might be IS-240200001
        // prefix length is 3 + 2 + 2 = 7 chars usually?
        // Let's assume standard running number at end
        const lastNum = parseInt(last.journal_issue_no.slice(-5)); // Assuming 5 digit running number as per legacy
        if (!isNaN(lastNum)) {
            return prefix + (lastNum + 1).toString().padStart(5, '0');
        }
    }
    return prefix + '00001';
}

async function generateStockTransNo(trx, type) {
    const prefix = type === 1 ? 'RIN' : 'ROT';
    const date = new Date();
    const dateStr = date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
    const last = await trx('stock_trans').where('trans_no', 'like', prefix + dateStr + '%').orderBy('trans_no', 'desc').first();
    if (last) {
        const lastNum = parseInt(last.trans_no.substr(-4));
        return prefix + dateStr + (lastNum + 1).toString().padStart(4, '0');
    }
    return prefix + dateStr + '0001';
}
