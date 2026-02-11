const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('payment_term').count('* as count');
        const total = totalQuery[0].count;

        let query = db('payment_term as pt')
            .leftJoin('payment_method as pm', 'pt.payment_method_id', 'pm.id')
            .select('pt.*', 'pm.name as payment_method_name')
            .orderBy('pt.id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;
        const paymentMethods = await db('payment_method').select('id', 'name');

        res.render('pay-terms/index', {
            items,
            paymentMethods,
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
    const { code, name, description, payment_method_id } = req.body;
    try {
        await db('payment_term').insert({
            code,
            name,
            description,
            payment_method_id: payment_method_id || null,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/pay-terms');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding payment term');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description, payment_method_id } = req.body;
    try {
        await db('payment_term').where({ id }).update({
            code,
            name,
            description,
            payment_method_id: payment_method_id || null,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/pay-terms');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating payment term');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('payment_term').where({ id }).delete();
        res.redirect('/pay-terms');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting payment term');
    }
};
