const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('job_card as jc')
            .leftJoin('contract as c', 'jc.contract_id', 'c.id')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id');

        let query = db('job_card as jc')
            .leftJoin('contract as c', 'jc.contract_id', 'c.id')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .select('jc.*', 'c.contract_no', 'cust.name as customer_name')
            .orderBy('jc.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('jc.job_card_no', 'like', `%${search}%`)
                    .orWhere('c.contract_no', 'like', `%${search}%`)
                    .orWhere('cust.name', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('jc.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('job-cards/index', {
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
        const contracts = await db('contract').select('id', 'contract_no');
        const employees = await db('employee').select('id', 'fname', 'lname');
        const servicePlans = await db('service_plan').select('id', 'plan_no');
        res.render('job-cards/create', { contracts, employees, servicePlans });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { job_card_no, contract_id, lines } = req.body;
    const trx = await db.transaction();
    try {
        const [id] = await trx('job_card').insert({
            job_card_no,
            contract_id: contract_id || null,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                job_card_id: id,
                job_count: line.job_count || 1,
                job_date: line.job_date || null,
                approve_id: line.approve_id || null,
                time_in: line.time_in || null,
                time_out: line.time_out || null,
                emp_service: line.emp_service || null,
                job_description: line.job_description || '',
                plan_id: line.plan_id || null,
                status: 1
            }));
            await trx('job_card_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/job-cards');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating job card');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('job_card').where({ id }).first();
        const lines = await db('job_card_line').where({ job_card_id: id });
        const contracts = await db('contract').select('id', 'contract_no');
        const employees = await db('employee').select('id', 'fname', 'lname');
        const servicePlans = await db('service_plan').select('id', 'plan_no');
        res.render('job-cards/edit', { item, lines, contracts, employees, servicePlans });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { job_card_no, contract_id, lines } = req.body;
    const trx = await db.transaction();
    try {
        await trx('job_card').where({ id }).update({
            job_card_no,
            contract_id: contract_id || null,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('job_card_line').where({ job_card_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                job_card_id: id,
                job_count: line.job_count || 1,
                job_date: line.job_date || null,
                approve_id: line.approve_id || null,
                time_in: line.time_in || null,
                time_out: line.time_out || null,
                emp_service: line.emp_service || null,
                job_description: line.job_description || '',
                plan_id: line.plan_id || null,
                status: 1
            }));
            await trx('job_card_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/job-cards');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating job card');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('job_card_line').where({ job_card_id: id }).delete();
        await trx('job_card').where({ id }).delete();
        await trx.commit();
        res.redirect('/job-cards');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting job card');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('job_card as jc')
            .leftJoin('contract as c', 'jc.contract_id', 'c.id')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .select('jc.*', 'c.contract_no', 'cust.name as customer_name', 'cust.address as customer_address', 'cust.phone as customer_phone')
            .where('jc.id', id)
            .first();

        const lines = await db('job_card_line as jcl')
            .leftJoin('employee as e', 'jcl.emp_service', 'e.id')
            .leftJoin('service_plan as sp', 'jcl.plan_id', 'sp.id')
            .select('jcl.*', 'e.fname as emp_fname', 'e.lname as emp_lname', 'sp.plan_no')
            .where({ job_card_id: id });

        const company = await db('company').first();

        res.render('job-cards/print', { item, lines, company });
    } catch (err) {
        console.error(err);
        res.status(500).send('Print Error');
    }
};
