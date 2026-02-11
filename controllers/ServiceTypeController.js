const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('service_type').count('* as count');
        const total = totalQuery[0].count;

        let query = db('service_type').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('service-types/index', {
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
    const { name, description } = req.body;
    try {
        await db('service_type').insert({
            name,
            description,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/service-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding service type');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { name, description } = req.body;
    try {
        await db('service_type').where({ id }).update({
            name,
            description,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/service-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating service type');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('service_type').where({ id }).delete();
        res.redirect('/service-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting service type');
    }
};
