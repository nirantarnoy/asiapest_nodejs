const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('service_plan as sp')
            .leftJoin('quotation as q', 'sp.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .leftJoin('car as c', 'sp.car_id', 'c.id');

        let query = db('service_plan as sp')
            .leftJoin('quotation as q', 'sp.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .leftJoin('car as c', 'sp.car_id', 'c.id')
            .select('sp.*', 'q.quotation_no', 'cust.name as customer_name', 'c.plate_number')
            .orderBy('sp.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('sp.plan_no', 'like', `%${search}%`)
                    .orWhere('q.quotation_no', 'like', `%${search}%`)
                    .orWhere('cust.name', 'like', `%${search}%`)
                    .orWhere('c.plate_number', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('sp.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('service-plans/index', {
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

exports.create = async (req, res) => {
    try {
        const quotations = await db('quotation').select('id', 'quotation_no');
        const contracts = await db('contract').select('id', 'contract_no');
        const cars = await db('car').select('id', 'plate_number');
        res.render('service-plans/create', { quotations, contracts, cars });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { plan_no, quotation_id, contract_id, target_date, confirm_date, status, note, interval_no, car_id } = req.body;
    try {
        await db('service_plan').insert({
            plan_no,
            quotation_id: quotation_id || null,
            contract_id: contract_id || null,
            target_date: target_date || null,
            confirm_date: confirm_date || null,
            status: status || 1,
            note,
            interval_no: interval_no || 1,
            car_id: car_id || null
        });
        res.redirect('/service-plans');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error creating service plan');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('service_plan').where({ id }).first();
        const quotations = await db('quotation').select('id', 'quotation_no');
        const contracts = await db('contract').select('id', 'contract_no');
        const cars = await db('car').select('id', 'plate_number');
        res.render('service-plans/edit', { item, quotations, contracts, cars });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { plan_no, quotation_id, contract_id, target_date, confirm_date, status, note, interval_no, car_id } = req.body;
    try {
        await db('service_plan').where({ id }).update({
            plan_no,
            quotation_id: quotation_id || null,
            contract_id: contract_id || null,
            target_date: target_date || null,
            confirm_date: confirm_date || null,
            status: status || 1,
            note,
            interval_no: interval_no || 1,
            car_id: car_id || null
        });
        res.redirect('/service-plans');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating service plan');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('service_plan').where({ id }).delete();
        res.redirect('/service-plans');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting service plan');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('service_plan as sp')
            .leftJoin('quotation as q', 'sp.quotation_id', 'q.id')
            .leftJoin('contract as c', 'sp.contract_id', 'c.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .leftJoin('car', 'sp.car_id', 'car.id')
            .select('sp.*', 'q.quotation_no', 'c.contract_no',
                'cust.name as customer_name', 'cust.address as customer_address', 'cust.phone as customer_phone',
                'car.plate_number', 'car.province')
            .where('sp.id', id)
            .first();

        const company = await db('company').first();

        res.render('service-plans/print', { item, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Print Error');
    }
};
