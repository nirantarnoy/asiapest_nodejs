const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('car as c')
            .leftJoin('car_type as ct', 'c.car_type_id', 'ct.id');

        let query = db('car as c')
            .leftJoin('car_type as ct', 'c.car_type_id', 'ct.id')
            .select('c.*', 'ct.name as type_name')
            .orderBy('c.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('c.code', 'like', `%${search}%`)
                    .orWhere('c.name', 'like', `%${search}%`)
                    .orWhere('c.plate_number', 'like', `%${search}%`)
                    .orWhere('ct.name', 'like', `%${search}%`);
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

        const cars = await query;
        const types = await db('car_type').select('id', 'name');
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('cars/index', {
            cars,
            types,
            activePage: 'car',
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
    const { code, name, description, car_type_id, plate_number } = req.body;
    try {
        await db('car').insert({ code, name, description, car_type_id, plate_number, created_by: req.session.user.id });
        res.redirect('/cars');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding car');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description, car_type_id, plate_number } = req.body;
    try {
        await db('car').where({ id }).update({ code, name, description, car_type_id, plate_number, updated_by: req.session.user.id });
        res.redirect('/cars');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating car');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('car').where({ id }).delete();
        res.redirect('/cars');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting car');
    }
};
