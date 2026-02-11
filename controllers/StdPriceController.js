const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('standard_price').count('* as count');
        const total = totalQuery[0].count;

        let query = db('standard_price').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('std-prices/index', {
            items,
            pagination: {
                page,
                limit: limit || 'all',
                total,
                totalPages
            }
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = async (req, res) => {
    try {
        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');
        res.render('std-prices/create', { products, units });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { journal_no, from_date, to_date, lines } = req.body;
    const trx = await db.transaction();
    try {
        const [id] = await trx('standard_price').insert({
            journal_no,
            from_date,
            to_date,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                standard_price_id: id,
                item_id: line.item_id,
                price1: line.price1 || 0,
                price2: line.price2 || 0,
                price3: line.price3 || 0,
                unit1: line.unit1 || null,
                unit2: line.unit2 || null,
                status: 1
            }));
            await trx('standard_price_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/std-prices');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating standard price');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('standard_price').where({ id }).first();
        const lines = await db('standard_price_line as spl')
            .leftJoin('product as p', 'spl.item_id', 'p.id')
            .select('spl.*', 'p.name as item_name', 'p.code as item_code')
            .where('spl.standard_price_id', id);

        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');

        res.render('std-prices/edit', { item, lines, products, units });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { journal_no, from_date, to_date, lines } = req.body;
    const trx = await db.transaction();
    try {
        await trx('standard_price').where({ id }).update({
            journal_no,
            from_date,
            to_date,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('standard_price_line').where({ standard_price_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                standard_price_id: id,
                item_id: line.item_id,
                price1: line.price1 || 0,
                price2: line.price2 || 0,
                price3: line.price3 || 0,
                unit1: line.unit1 || null,
                unit2: line.unit2 || null,
                status: 1
            }));
            await trx('standard_price_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/std-prices');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating standard price');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('standard_price_line').where({ standard_price_id: id }).delete();
        await trx('standard_price').where({ id }).delete();
        await trx.commit();
        res.redirect('/std-prices');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting standard price');
    }
};
