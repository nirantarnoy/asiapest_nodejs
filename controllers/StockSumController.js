const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('stock_sum').count('* as count');
        const total = totalQuery[0].count;

        let query = db('stock_sum as ss')
            .leftJoin('product as p', 'ss.product_id', 'p.id')
            .leftJoin('warehouse as w', 'ss.warehouse_id', 'w.id')
            .leftJoin('location as l', 'ss.location_id', 'l.id')
            .select(
                'ss.*',
                'p.name as product_name',
                'p.code as product_code',
                'w.name as warehouse_name',
                'l.name as location_name'
            )
            .orderBy('ss.id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const stocks = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('stock-sum/index', {
            stocks,
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
