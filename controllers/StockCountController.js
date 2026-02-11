const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('stock_count').count('* as count');
        const total = totalQuery[0].count;

        let query = db('stock_count')
            .select('*')
            .orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const counts = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('stock-count/index', {
            counts,
            activePage: 'warehouse',
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

exports.add = async (req, res) => {
    const { journal_no, trans_date } = req.body;
    try {
        await db('stock_count').insert({
            journal_no,
            trans_date,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/stock-count');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding stock count');
    }
};

exports.view = async (req, res) => {
    const { id } = req.params;
    try {
        const count = await db('stock_count').where({ id }).first();
        if (!count) return res.status(404).send('Not Found');

        const products = await db('product').select('id', 'code', 'name');
        const lines = await db('stock_count_line as scl')
            .leftJoin('product as p', 'scl.product_id', 'p.id')
            .where('scl.stock_count_id', id)
            .select('scl.*', 'p.name as product_name', 'p.code as product_code')
            .orderBy('scl.id', 'asc');

        res.render('stock-count/view', { count, lines, products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.saveLines = async (req, res) => {
    const { id } = req.params;
    const { lines } = req.body; // Array of {product_id, qty, counted}
    const trx = await db.transaction();
    try {
        // Clear old lines
        await trx('stock_count_line').where({ stock_count_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(l => ({
                stock_count_id: id,
                product_id: l.product_id,
                qty: l.qty || 0,
                counted: l.counted || 0,
                diff_qty: (l.counted || 0) - (l.qty || 0),
                status: 1
            }));
            if (lineData.length > 0) {
                await trx('stock_count_line').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect(`/stock-count/view/${id}`);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error saving lines');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('stock_count').where({ id }).delete();
        res.redirect('/stock-count');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting stock count');
    }
};
