const db = require('../config/db');

exports.stockMovement = async (req, res) => {
    try {
        const { start_date, end_date, product_id } = req.query;

        const products = await db('product').select('id', 'code', 'name');

        let query = db('stock_trans as st')
            .leftJoin('product as p', 'st.product_id', 'p.id')
            .select('st.*', 'p.code as product_code', 'p.name as product_name')
            .orderBy('st.id', 'desc');

        if (start_date) query = query.where('st.trans_date', '>=', start_date);
        if (end_date) query = query.where('st.trans_date', '<=', end_date);
        if (product_id) query = query.where('st.product_id', product_id);

        const items = await query.limit(100);

        res.render('reports/stock-movement', { items, products, filters: { start_date, end_date, product_id } });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.salesReport = async (req, res) => {
    try {
        const { start_date, end_date } = req.query;

        let query = db('quotation as q')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .select('q.*', 'c.name as customer_name')
            .where('q.status', '>', 0)
            .orderBy('q.quotation_date', 'desc');

        if (start_date) query = query.where('q.quotation_date', '>=', start_date);
        if (end_date) query = query.where('q.quotation_date', '<=', end_date);

        const items = await query;

        res.render('reports/sales-report', { items, filters: { start_date, end_date } });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};
