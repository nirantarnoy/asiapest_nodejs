const db = require('../config/db');
const { logAction } = require('../utils/logger');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('customer as c')
            .leftJoin('customer_group as cg', 'c.customer_group_id', 'cg.id')
            .leftJoin('customer_type as ct', 'c.customer_type_id', 'ct.id');

        let query = db('customer as c')
            .leftJoin('customer_group as cg', 'c.customer_group_id', 'cg.id')
            .leftJoin('customer_type as ct', 'c.customer_type_id', 'ct.id')
            .select('c.*', 'cg.name as group_name', 'ct.name as type_name')
            .orderBy('c.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('c.code', 'like', `%${search}%`)
                    .orWhere('c.name', 'like', `%${search}%`)
                    .orWhere('c.phone', 'like', `%${search}%`)
                    .orWhere('c.email', 'like', `%${search}%`)
                    .orWhere('cg.name', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('c.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const customers = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        const groups = await db('customer_group').select('id', 'name');
        const types = await db('customer_type').select('id', 'name');

        res.render('customers/index', {
            customers,
            groups,
            types,
            activePage: 'customers',
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

exports.add = async (req, res) => {
    const {
        code, name, description,
        customer_group_id, customer_type_id,
        phone, contact_name, email, address
    } = req.body;
    try {
        const ids = await db('customer').insert({
            code, name, description,
            customer_group_id, customer_type_id,
            phone, contact_name, email, address,
            created_by: req.session.user.id
        });

        const newId = ids[0];
        await logAction({
            req,
            action: 'CREATE',
            tableName: 'customer',
            rowId: newId,
            dataAfter: { code, name, customer_group_id, customer_type_id, phone, contact_name, email, address }
        });

        res.redirect('/customers');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding customer');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const {
        code, name, description,
        customer_group_id, customer_type_id,
        phone, contact_name, email, address
    } = req.body;
    try {
        const itemBefore = await db('customer').where({ id }).first();
        await db('customer').where({ id }).update({
            code, name, description,
            customer_group_id, customer_type_id,
            phone, contact_name, email, address,
            updated_by: req.session.user.id
        });

        await logAction({
            req,
            action: 'UPDATE',
            tableName: 'customer',
            rowId: id,
            dataBefore: itemBefore,
            dataAfter: { code, name, description, customer_group_id, customer_type_id, phone, contact_name, email, address }
        });

        res.redirect('/customers');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating customer');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        const itemBefore = await db('customer').where({ id }).first();
        await db('customer').where({ id }).delete();

        await logAction({
            req,
            action: 'DELETE',
            tableName: 'customer',
            rowId: id,
            dataBefore: itemBefore
        });

        res.redirect('/customers');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting customer');
    }
};
