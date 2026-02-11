const db = require('../config/db');
const { logAction } = require('../utils/logger');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('contract as c')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id');

        let query = db('contract as c')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .select('c.*', 'q.quotation_no', 'cust.name as customer_name')
            .orderBy('c.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('c.contract_no', 'like', `%${search}%`)
                    .orWhere('q.quotation_no', 'like', `%${search}%`)
                    .orWhere('cust.name', 'like', `%${search}%`);
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

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('contracts/index', {
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
        res.render('contracts/create', { quotations });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { contract_no, contract_date, quotation_id, contract_start_date, contract_expire_date, status, problem, problem_cause, taken_action } = req.body;
    try {
        const ids = await db('contract').insert({
            contract_no,
            contract_date: contract_date || null,
            quotation_id: quotation_id || null,
            contract_start_date: contract_start_date || null,
            contract_expire_date: contract_expire_date || null,
            status: status || 1,
            problem,
            problem_cause,
            taken_action,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        const newId = ids[0];
        await logAction({
            req,
            action: 'CREATE',
            tableName: 'contract',
            rowId: newId,
            dataAfter: { contract_no, contract_date, quotation_id, contract_start_date, contract_expire_date, status, problem, problem_cause, taken_action }
        });

        res.redirect('/contracts');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error creating contract');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('contract').where({ id }).first();
        const quotations = await db('quotation').select('id', 'quotation_no');
        res.render('contracts/edit', { item, quotations });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { contract_no, contract_date, quotation_id, contract_start_date, contract_expire_date, status, problem, problem_cause, taken_action } = req.body;
    try {
        const itemBefore = await db('contract').where({ id }).first();
        await db('contract').where({ id }).update({
            contract_no,
            contract_date: contract_date || null,
            quotation_id: quotation_id || null,
            contract_start_date: contract_start_date || null,
            contract_expire_date: contract_expire_date || null,
            status: status || 1,
            problem,
            problem_cause,
            taken_action,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await logAction({
            req,
            action: 'UPDATE',
            tableName: 'contract',
            rowId: id,
            dataBefore: itemBefore,
            dataAfter: { contract_no, contract_date, quotation_id, contract_start_date, contract_expire_date, status, problem, problem_cause, taken_action }
        });

        res.redirect('/contracts');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating contract');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        const itemBefore = await db('contract').where({ id }).first();
        await db('contract').where({ id }).delete();

        await logAction({
            req,
            action: 'DELETE',
            tableName: 'contract',
            rowId: id,
            dataBefore: itemBefore
        });

        res.redirect('/contracts');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting contract');
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const contract = await db('contract as c')
            .leftJoin('quotation as q', 'c.quotation_id', 'q.id')
            .leftJoin('customer as cust', 'q.customer_id', 'cust.id')
            .leftJoin('service_type as st', 'q.service_type_id', 'st.id')
            .leftJoin('employee as e', 'q.sale_emp_id', 'e.id')
            .select('c.*', 'q.quotation_no', 'cust.name as customer_name', 'cust.address as customer_address', 'cust.phone as customer_phone', 'cust.tax_id as customer_tax_id', 'cust.contact_name as customer_contact_name', 'st.name as service_type_name', 'e.fname as sale_fname', 'e.lname as sale_lname')
            .where('c.id', id)
            .first();

        const company = await db('company').first();

        res.render('contracts/print', { contract, company, layout: false });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.approve = async (req, res) => {
    const { id } = req.params;
    try {
        await db('contract').where({ id }).update({
            status: 2,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/contracts');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error approving contract');
    }
};

exports.generatePlan = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        const contract = await trx('contract').where({ id }).first();
        if (!contract || !contract.quotation_id) {
            await trx.rollback();
            return res.status(404).send('Contract or Quotation not found');
        }

        const jobLines = await trx('quotation_job_line').where({ quotation_id: contract.quotation_id });

        for (const line of jobLines) {
            const loops = line.job_interval || 0;
            const freqCount = line.job_count || 1;
            const freqUnit = line.interval_type; // 1: day, 2: week, 3: month, 4: year

            let currentDate = new Date();
            if (contract.contract_start_date) {
                currentDate = new Date(contract.contract_start_date);
            }

            for (let i = 1; i <= loops; i++) {
                // Generate Plan No
                const last = await trx('service_plan').orderBy('id', 'desc').first();
                let nextPNum = 1;
                if (last && last.plan_no) {
                    const txt = last.plan_no.substring(2);
                    const n = parseInt(txt);
                    if (!isNaN(n)) nextPNum = n + 1;
                }
                const planNo = 'SP' + nextPNum.toString().padStart(6, '0');

                await trx('service_plan').insert({
                    plan_no: planNo,
                    quotation_id: contract.quotation_id,
                    contract_id: contract.id,
                    quotation_job_id: line.quotation_job_id,
                    quoation_job_line_id: line.id,
                    target_date: currentDate.toISOString().split('T')[0],
                    status: 1,
                    interval_no: i
                });

                // Advance date
                if (freqUnit == 1) currentDate.setDate(currentDate.getDate() + freqCount);
                else if (freqUnit == 2) currentDate.setDate(currentDate.getDate() + (freqCount * 7));
                else if (freqUnit == 3) currentDate.setMonth(currentDate.getMonth() + freqCount);
                else if (freqUnit == 4) currentDate.setFullYear(currentDate.getFullYear() + freqCount);
                else currentDate.setDate(currentDate.getDate() + freqCount); // default days
            }
        }

        await trx.commit();
        res.redirect('/service-plans?contract_id=' + id);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error generating plans');
    }
};

exports.timeline = async (req, res) => {
    const { id } = req.params;
    try {
        const contract = await db('contract').where({ id }).first();
        if (!contract) return res.status(404).send('Contract not found');

        const quotation = await db('quotation').where({ id: contract.quotation_id }).first();
        const estimate = quotation ? await db('estimateprice').where({ id: quotation.estimate_id }).first() : null;

        const services = estimate ? await db('service').where({ estimate_id: estimate.id }) : [];
        const plans = await db('service_plan').where({ contract_id: id }).orderBy('target_date', 'asc');
        const jobCards = await db('job_card').where({ contract_id: id });

        res.render('contracts/timeline', {
            contract,
            quotation,
            estimate,
            services,
            plans,
            jobCards
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.createPlan = exports.generatePlan;

async function generateServicePlanNo(trx) {
    const last = await trx('service_plan').orderBy('id', 'desc').first();
    let nextNum = 1;
    if (last && last.plan_no) {
        // Assume format SPxxxx
        const txt = last.plan_no.substring(2);
        const num = parseInt(txt);
        if (!isNaN(num)) nextNum = num + 1;
    }
    return 'SP' + nextNum.toString().padStart(4, '0');
}
