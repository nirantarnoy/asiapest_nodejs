const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('user_group').count('* as count');
        const total = totalQuery[0].count;

        let query = db('user_group').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('user-groups/index', {
            items,
            activePage: 'users',
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
        await db('user_group').insert({
            code,
            name,
            description,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/user-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding user group');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        await db('user_group').where({ id }).update({
            code,
            name,
            description,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/user-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating user group');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('user_group').where({ id }).delete();
        res.redirect('/user-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting user group');
    }
};
