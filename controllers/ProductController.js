const db = require('../config/db');
const { logAction } = require('../utils/logger');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('product');
        let query = db('product').orderBy('id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('code', 'like', `%${search}%`)
                    .orWhere('name', 'like', `%${search}%`)
                    .orWhere('description', 'like', `%${search}%`);
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

        const products = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('products/index', {
            products,
            activePage: 'products',
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
    const { code, name, description, sale_price, std_cost } = req.body;
    try {
        const ids = await db('product').insert({
            code,
            name,
            description,
            sale_price: sale_price || 0,
            std_cost: std_cost || 0,
            created_by: req.session.user.id
        });

        const newId = ids[0];
        await logAction({
            req,
            action: 'CREATE',
            tableName: 'product',
            rowId: newId,
            dataAfter: { code, name, description, sale_price, std_cost }
        });

        res.redirect('/products');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding product');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description, sale_price, std_cost } = req.body;
    try {
        const itemBefore = await db('product').where({ id }).first();
        await db('product').where({ id }).update({
            code,
            name,
            description,
            sale_price: sale_price || 0,
            std_cost: std_cost || 0,
            updated_by: req.session.user.id
        });

        await logAction({
            req,
            action: 'UPDATE',
            tableName: 'product',
            rowId: id,
            dataBefore: itemBefore,
            dataAfter: { code, name, description, sale_price, std_cost }
        });

        res.redirect('/products');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating product');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        const itemBefore = await db('product').where({ id }).first();
        await db('product').where({ id }).delete();

        await logAction({
            req,
            action: 'DELETE',
            tableName: 'product',
            rowId: id,
            dataBefore: itemBefore
        });

        res.redirect('/products');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting product');
    }
};
