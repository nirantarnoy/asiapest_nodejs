const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('company').count('* as count');
        const total = totalQuery[0].count;

        let query = db('company').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('company/index', {
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
    const { code, name, eng_name, description, tax_id, address, phone, email } = req.body;
    try {
        await db('company').insert({
            code,
            name,
            eng_name,
            description,
            tax_id,
            address,
            phone,
            email,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/company');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding company');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, eng_name, description, tax_id, address, phone, email } = req.body;
    try {
        await db('company').where({ id }).update({
            code,
            name,
            eng_name,
            description,
            tax_id,
            address,
            phone,
            email,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/company');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating company');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('company').where({ id }).delete();
        res.redirect('/company');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting company');
    }
};
