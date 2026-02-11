const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('payment_method').count('* as count');
        const total = totalQuery[0].count;

        let query = db('payment_method').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('pay-methods/index', {
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

exports.add = async (req, res) => {
    const { code, name, description } = req.body;
    try {
        await db('payment_method').insert({
            code,
            name,
            description,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/pay-methods');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding payment method');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        await db('payment_method').where({ id }).update({
            code,
            name,
            description,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/pay-methods');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating payment method');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('payment_method').where({ id }).delete();
        res.redirect('/pay-methods');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting payment method');
    }
};
