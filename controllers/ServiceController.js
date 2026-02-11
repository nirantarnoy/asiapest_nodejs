const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';
        const status = req.query.status || '';

        // Build base query with search and filter
        let countQuery = db('service as s')
            .leftJoin('estimateprice as ep', 's.estimate_id', 'ep.id')
            .leftJoin('customer as c', 'ep.customer_id', 'c.id');

        let query = db('service as s')
            .leftJoin('estimateprice as ep', 's.estimate_id', 'ep.id')
            .leftJoin('customer as c', 'ep.customer_id', 'c.id')
            .leftJoin('user as u', 's.created_by', 'u.id')
            .select(
                's.*',
                'ep.journal_no',
                'c.name as customer_name',
                'c.address as customer_address',
                'c.phone as customer_phone',
                'c.email as customer_email',
                'u.username as creator_name'
            )
            .orderBy('s.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('s.service_no', 'like', `%${search}%`)
                    .orWhere('ep.journal_no', 'like', `%${search}%`)
                    .orWhere('c.name', 'like', `%${search}%`)
                    .orWhere('s.description', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        // Apply status filter
        if (status !== '') {
            query.where('s.status', status);
            countQuery.where('s.status', status);
        }

        const totalQuery = await countQuery.count('s.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('service/index', {
            items,
            pagination: {
                page,
                limit: limit || 'all',
                total,
                totalPages
            },
            search,
            status
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.view = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('service as s')
            .leftJoin('estimateprice as ep', 's.estimate_id', 'ep.id')
            .leftJoin('customer as c', 'ep.customer_id', 'c.id')
            .leftJoin('user as u', 's.created_by', 'u.id')
            .select(
                's.*',
                'ep.journal_no',
                'c.name as customer_name',
                'c.address as customer_address',
                'c.phone as customer_phone',
                'c.email as customer_email',
                'u.username as creator_name'
            )
            .where('s.id', id)
            .first();

        if (!item) {
            return res.status(404).send('Service Order not found');
        }

        // Get estimate lines if estimate_id exists
        let lines = [];
        if (item.estimate_id) {
            lines = await db('estimateprice_line as el')
                .leftJoin('product as p', 'el.item_id', 'p.id')
                .select(
                    'el.*',
                    'p.code as product_code',
                    'p.name as product_name',
                    'el.price',
                    'el.qty'
                )
                .where('el.estimate_id', item.estimate_id);
        }

        res.render('service/view', { item, lines });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.showEdit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('service as s')
            .leftJoin('estimateprice as ep', 's.estimate_id', 'ep.id')
            .select('s.*', 'ep.journal_no')
            .where('s.id', id)
            .first();

        if (!item) {
            return res.status(404).send('Service Order not found');
        }

        res.render('service/edit', { item });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { status, description } = req.body;

    try {
        await db('service')
            .where({ id })
            .update({
                status: parseInt(status),
                description,
                updated_at: Math.floor(Date.now() / 1000),
                updated_by: req.session.user.id
            });

        res.redirect(`/service/view/${id}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating service');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('service as s')
            .leftJoin('estimateprice as ep', 's.estimate_id', 'ep.id')
            .leftJoin('customer as c', 'ep.customer_id', 'c.id')
            .leftJoin('user as u', 's.created_by', 'u.id')
            .select(
                's.*',
                'ep.journal_no',
                'c.name as customer_name',
                'c.address as customer_address',
                'c.phone as customer_phone',
                'c.email as customer_email',
                'u.username as creator_name'
            )
            .where('s.id', id)
            .first();

        if (!item) {
            return res.status(404).send('Service Order not found');
        }

        // Get estimate lines if estimate_id exists
        let lines = [];
        if (item.estimate_id) {
            lines = await db('estimateprice_line as el')
                .leftJoin('product as p', 'el.item_id', 'p.id')
                .select(
                    'el.*',
                    'p.code as product_code',
                    'p.name as product_name',
                    'el.price',
                    'el.qty'
                )
                .where('el.estimate_id', item.estimate_id);
        }

        // Get company info
        const company = await db('company').first();

        res.render('service/print', { item, lines, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('service').where({ id }).delete();
        res.redirect('/service');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting service');
    }
};

exports.createIssue = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        const service = await trx('service').where({ id }).first();
        if (!service) {
            await trx.rollback();
            return res.status(404).send('Service not found');
        }

        const estimateLines = await trx('estimateprice_line').where({ estimate_id: service.estimate_id });

        if (estimateLines.length > 0) {
            const journalNo = await generateJournalIssueNo(trx);

            const [journalId] = await trx('journal_issue').insert({
                journal_issue_no: journalNo,
                trans_date: new Date(),
                status: 1,
                reason: 'Created from Service Order ' + service.service_no,
                created_by: req.session.user.id,
                created_at: Math.floor(Date.now() / 1000)
            });

            for (const line of estimateLines) {
                await trx('journal_issue_line').insert({
                    journal_issue_id: journalId,
                    product_id: line.item_id,
                    qty: line.qty,
                    price: line.price || 0,
                    note: ''
                });
            }
        }

        await trx.commit();
        res.redirect('/journal-issue'); // Redirect to Journal Issue list to see created issue
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating issue');
    }
};

async function generateJournalIssueNo(trx) {
    const prefix = 'JI' + new Date().getFullYear().toString().substr(2, 2); // e.g. JI24
    // Check pattern JIYY-XXXX? Or JIYYXXXX?
    // JournalIssueController.js doesn't show generation logic (it uses manual input or auto?).
    // Only store() uses req.body.journal_issue_no.
    // Let's assume JI-YYMM-XXXX or similar.
    // PHP: getLastNo()
    // Let's use a simple format JI-YYMM-XXXX
    const date = new Date();
    const curYear = date.getFullYear().toString().substr(2, 2);
    const curMonth = (date.getMonth() + 1).toString().padStart(2, '0');
    const runPrefix = `JI${curYear}${curMonth}`; // JI2402

    const last = await trx('journal_issue')
        .where('journal_issue_no', 'like', `${runPrefix}%`)
        .orderBy('journal_issue_no', 'desc')
        .first();

    let nextNum = 1;
    if (last) {
        const numStr = last.journal_issue_no.replace(runPrefix, '');
        const num = parseInt(numStr);
        if (!isNaN(num)) nextNum = num + 1;
    }
    return runPrefix + nextNum.toString().padStart(4, '0');
}
