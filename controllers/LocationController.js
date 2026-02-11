const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('location').count('* as count');
        const total = totalQuery[0].count;

        let query = db('location as l')
            .leftJoin('warehouse as w', 'l.warehouse_id', 'w.id')
            .select('l.*', 'w.name as warehouse_name')
            .orderBy('l.id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const locations = await query;
        const warehouses = await db('warehouse').select('id', 'name');
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('locations/index', {
            locations,
            warehouses,
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

exports.add = async (req, res) => {
    const { code, name, warehouse_id, description } = req.body;
    try {
        await db('location').insert({
            code,
            name,
            warehouse_id,
            description,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/locations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding location');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, warehouse_id, description } = req.body;
    try {
        await db('location').where({ id }).update({
            code,
            name,
            warehouse_id,
            description,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/locations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating location');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('location').where({ id }).delete();
        res.redirect('/locations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting location');
    }
};
