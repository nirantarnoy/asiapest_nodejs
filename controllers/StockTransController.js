const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('stock_trans').count('* as count');
        const total = totalQuery[0].count;

        let query = db('stock_trans as st')
            .leftJoin('product as p', 'st.product_id', 'p.id')
            .select(
                'st.*',
                'p.name as product_name',
                'p.code as product_code'
            )
            .orderBy('st.id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const transactions = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('stock-trans/index', {
            transactions,
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

// Helper function to get stock type name
function getStockTypeName(type) {
    const types = {
        1: 'รับเข้า',
        2: 'เบิกออก',
        3: 'ปรับปรุง',
        4: 'โอนย้าย'
    };
    return types[type] || 'ไม่ระบุ';
}

// Make it available to views
exports.getStockTypeName = getStockTypeName;
