const db = require('../config/db');
const { logAction } = require('../utils/logger');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('warehouse').count('* as count');
        const total = totalQuery[0].count;

        let query = db('warehouse').select('*').orderBy('id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('warehouses/index', {
            items,
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
    const { code, name, description } = req.body;
    try {
        const ids = await db('warehouse').insert({
            code,
            name,
            description,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        const newId = ids[0];
        await logAction({
            req,
            action: 'CREATE',
            tableName: 'warehouse',
            rowId: newId,
            dataAfter: { code, name, description, status: 1 }
        });

        res.redirect('/warehouses');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding warehouse');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        const itemBefore = await db('warehouse').where({ id }).first();
        await db('warehouse').where({ id }).update({
            code,
            name,
            description,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await logAction({
            req,
            action: 'UPDATE',
            tableName: 'warehouse',
            rowId: id,
            dataBefore: itemBefore,
            dataAfter: { code, name, description }
        });

        res.redirect('/warehouses');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating warehouse');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        const itemBefore = await db('warehouse').where({ id }).first();
        await db('warehouse').where({ id }).delete();

        await logAction({
            req,
            action: 'DELETE',
            tableName: 'warehouse',
            rowId: id,
            dataBefore: itemBefore
        });

        res.redirect('/warehouses');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting warehouse');
    }
};
