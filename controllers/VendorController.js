const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('vendor');
        let query = db('vendor').orderBy('id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('name', 'like', `%${search}%`)
                    .orWhere('contact_name', 'like', `%${search}%`)
                    .orWhere('phone', 'like', `%${search}%`)
                    .orWhere('email', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('vendors/index', {
            items,
            pagination: {
                page,
                limit: limit || 'all',
                total,
                totalPages
            },
            search
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = (req, res) => {
    res.render('vendors/create');
};

exports.store = async (req, res) => {
    const { name, address, phone, email, tax_id, contact_name } = req.body;
    try {
        await db('vendor').insert({
            name,
            address,
            phone,
            email,
            tax_id,
            contact_name,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/vendors');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error creating vendor');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('vendor').where({ id }).first();
        res.render('vendors/edit', { item });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { name, address, phone, email, tax_id, contact_name } = req.body;
    try {
        await db('vendor').where({ id }).update({
            name,
            address,
            phone,
            email,
            tax_id,
            contact_name,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/vendors');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating vendor');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('vendor').where({ id }).delete();
        res.redirect('/vendors');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting vendor');
    }
};
