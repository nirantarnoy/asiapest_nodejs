const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('purch_req as pr')
            .leftJoin('user as u', 'pr.created_by', 'u.id');

        let query = db('purch_req as pr')
            .leftJoin('user as u', 'pr.created_by', 'u.id')
            .select('pr.*', 'u.username as creator_name')
            .orderBy('pr.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('pr.purch_req_no', 'like', `%${search}%`)
                    .orWhere('pr.note', 'like', `%${search}%`)
                    .orWhere('u.username', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('pr.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('purch-req/index', {
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
        res.render('purch-req/create', { products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { purch_req_date, note, lines } = req.body;
    const trx = await db.transaction();
    try {
        const lastNo = await generatePRNo(trx);
        const [id] = await trx('purch_req').insert({
            purch_req_no: lastNo,
            purch_req_date: purch_req_date || new Date().toISOString().split('T')[0],
            note,
            status: 1,
            approve_token: Math.random().toString(36).substring(7),
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                purch_req_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1
            }));
            if (lineData.length > 0) {
                await trx('purch_req_line').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect('/pur-req');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating PR');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('purch_req').where({ id }).first();
        const lines = await db('purch_req_line as prl')
            .leftJoin('product as p', 'prl.product_id', 'p.id')
            .select('prl.*', 'p.code as product_code', 'p.name as product_name')
            .where({ purch_req_id: id });
        const products = await db('product').select('id', 'code', 'name');
        res.render('purch-req/edit', { item, lines, products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { purch_req_date, note, lines } = req.body;
    const trx = await db.transaction();
    try {
        await trx('purch_req').where({ id }).update({
            purch_req_date,
            note,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('purch_req_line').where({ purch_req_id: id }).delete();
        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                purch_req_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1
            }));
            if (lineData.length > 0) {
                await trx('purch_req_line').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect('/pur-req');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating PR');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('purch_req_line').where({ purch_req_id: id }).delete();
        await trx('purch_req').where({ id }).delete();
        await trx.commit();
        res.redirect('/pur-req');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting PR');
    }
};

exports.approve = async (req, res) => {
    const { id } = req.params;
    try {
        await db('purch_req').where({ id }).update({
            status: 4,
            updated_at: Math.floor(Date.now() / 1000)
        });
        await db('purch_req_line').where({ purch_req_id: id }).update({ status: 4 });
        res.redirect('/pur-req');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error approving PR');
    }
};

async function generatePRNo(trx) {
    const date = new Date();
    const prefix = 'PR' + date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
    const lastPR = await trx('purch_req').where('purch_req_no', 'like', prefix + '%').orderBy('purch_req_no', 'desc').first();
    if (lastPR) {
        const lastNum = parseInt(lastPR.purch_req_no.substr(-4));
        return prefix + (lastNum + 1).toString().padStart(4, '0');
    }
    return prefix + '0001';
}

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('purch_req as pr')
            .leftJoin('user as u', 'pr.created_by', 'u.id')
            .select('pr.*', 'u.username as creator_fname') // fallback to username since no fname/lname
            .where('pr.id', id)
            .first();

        const lines = await db('purch_req_line as prl')
            .leftJoin('product as p', 'prl.product_id', 'p.id')
            .select('prl.*', 'p.code as product_code', 'p.name as product_name')
            .where({ purch_req_id: id });

        const company = await db('company').first();

        res.render('purch-req/print', { item, lines, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Print Error');
    }
};
