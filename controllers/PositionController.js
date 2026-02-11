const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('position').count('* as count');
        const total = totalQuery[0].count;

        let query = db('position').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('positions/index', {
            items,
            activePage: 'employee',
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
        await db('position').insert({ code, name, description, created_by: req.session.user.id });
        res.redirect('/positions');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding item');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        await db('position').where({ id }).update({ code, name, description, updated_by: req.session.user.id });
        res.redirect('/positions');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating item');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('position').where({ id }).delete();
        res.redirect('/positions');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting item');
    }
};
