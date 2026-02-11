const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;

        const totalQuery = await db('estimateprice').count('* as count');
        const total = totalQuery[0].count;

        let query = db('estimateprice as ep')
            .leftJoin('customer as c', 'ep.customer_id', 'c.id')
            .leftJoin('service_type as st', 'ep.service_type_id', 'st.id')
            .select('ep.*', 'c.name as customer_name', 'st.name as service_type_name')
            .orderBy('ep.id', 'desc');

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('estimate-price/index', {
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

exports.create = async (req, res) => {
    try {
        const customers = await db('customer').select('id', 'name');
        const serviceTypes = await db('service_type').select('id', 'name');
        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');
        res.render('estimate-price/create', { customers, serviceTypes, products, units });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const {
        journal_no, trans_date, customer_id, service_place,
        building_size, ground_size, service_type_id,
        additional_amount, estimate_total_amount, lines
    } = req.body;

    const trx = await db.transaction();
    try {
        const [id] = await trx('estimateprice').insert({
            journal_no,
            trans_date: trans_date || null,
            customer_id: customer_id || null,
            service_place,
            building_size: building_size || 0,
            ground_size: ground_size || 0,
            service_type_id: service_type_id || null,
            additional_amount: additional_amount || 0,
            estimate_total_amount: estimate_total_amount || 0,
            status: 0, // Draft
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                estimate_id: id,
                item_id: line.item_id,
                qty: line.qty || 0,
                price: line.price || 0,
                unit_id: line.unit_id || null,
                service_count: line.service_count || 0,
                line_total: line.line_total || 0,
                status: 1,
                created_by: req.session.user.id,
                created_at: Math.floor(Date.now() / 1000)
            }));
            await trx('estimateprice_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/estimate-price');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating estimate price');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('estimateprice').where({ id }).first();
        const lines = await db('estimateprice_line as el')
            .leftJoin('product as p', 'el.item_id', 'p.id')
            .select('el.*', 'p.name as item_name', 'p.code as item_code')
            .where('el.estimate_id', id);

        const customers = await db('customer').select('id', 'name');
        const serviceTypes = await db('service_type').select('id', 'name');
        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');

        res.render('estimate-price/edit', { item, lines, customers, serviceTypes, products, units });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const {
        journal_no, trans_date, customer_id, service_place,
        building_size, ground_size, service_type_id,
        additional_amount, estimate_total_amount, lines
    } = req.body;

    const trx = await db.transaction();
    try {
        await trx('estimateprice').where({ id }).update({
            journal_no,
            trans_date: trans_date || null,
            customer_id: customer_id || null,
            service_place,
            building_size: building_size || 0,
            ground_size: ground_size || 0,
            service_type_id: service_type_id || null,
            additional_amount: additional_amount || 0,
            estimate_total_amount: estimate_total_amount || 0,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('estimateprice_line').where({ estimate_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                estimate_id: id,
                item_id: line.item_id,
                qty: line.qty || 0,
                price: line.price || 0,
                unit_id: line.unit_id || null,
                service_count: line.service_count || 0,
                line_total: line.line_total || 0,
                status: 1,
                updated_by: req.session.user.id,
                updated_at: Math.floor(Date.now() / 1000)
            }));
            await trx('estimateprice_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/estimate-price');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating estimate price');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('estimateprice_line').where({ estimate_id: id }).delete();
        await trx('estimateprice').where({ id }).delete();
        await trx.commit();
        res.redirect('/estimate-price');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting estimate price');
    }
};

exports.approve = async (req, res) => {
    const { id } = req.params;
    try {
        await db('estimateprice').where({ id }).update({
            status: 1,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/estimate-price');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error approving estimate price');
    }
};

exports.confirmToService = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        const serviceNo = await generateServiceNo(trx);

        // table name is 'service' per common/models/Service.php
        await trx('service').insert({
            service_no: serviceNo,
            estimate_id: id,
            status: 0,
            created_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('estimateprice').where({ id }).update({
            status: 2
        });

        await trx.commit();
        res.redirect('/estimate-price');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error confirming to service');
    }
};

async function generateServiceNo(trx) {
    const prefix = 'SV-' + new Date().getFullYear().toString().substr(2, 2);
    const last = await trx('service')
        .where('service_no', 'like', `${prefix}%`)
        .orderBy('service_no', 'desc')
        .first();

    let nextNum = 1;
    if (last && last.service_no) {
        // expected format SV-YYxxxxx
        const parts = last.service_no.split('-');
        if (parts.length > 1) {
            // part[0]=SV, part[1]=YYxxxxx ??
            // PHP logic: $cnum = substr((string)$model, 5, 5); -> from index 5 get 5 chars?
            // $prefix = SV-YY;
            // If SV-2600001
            // substr('SV-2600001', 5, 5) -> '00001'
            // So we extract the last 5 digits.
            const numStr = last.service_no.substring(5);
            const num = parseInt(numStr);
            if (!isNaN(num)) nextNum = num + 1;
        }
    }
    return prefix + nextNum.toString().padStart(5, '0');
}
