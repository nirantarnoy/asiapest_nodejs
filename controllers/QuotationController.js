const db = require('../config/db');

// Helper for Interval Types (should match backend\helpers\IntervalType)
const getIntervalTypes = () => [
    { id: 1, name: 'วัน' },
    { id: 2, name: 'สัปดาห์' },
    { id: 3, name: 'เดือน' },
    { id: 4, name: 'ปี' }
];

exports.jobDetails = async (req, res) => {
    const { id } = req.params;
    try {
        const quotation = await db('quotation').where({ id }).first();
        if (!quotation) return res.status(404).send('Quotation not found');

        // Fetch existing job lines
        // We need to join quotation_job_line with quotation_job to get the structure flat
        const jobLines = await db('quotation_job_line as qjl')
            .join('quotation_job as qj', 'qjl.quotation_job_id', 'qj.id')
            .where('qjl.quotation_id', id)
            .select(
                'qjl.*',
                'qj.title',
                'qj.task_job_id',
                'qj.task_job_method_id'
            );

        // Fetch Tasks for dropdown
        const tasks = await db('task').select('id', 'title');

        // Fetch Methods for each line to pre-populate dropdowns if needed
        // Ideally we pass all methods, but that's too much data.
        // We will fetch methods for each unique task_id in the lines.
        for (let line of jobLines) {
            if (line.task_job_id) {
                line.methods = await db('task_detail').where('task_title_id', line.task_job_id).select('id', 'task_method_name', 'description');
            }
        }

        const intervalTypes = getIntervalTypes();

        res.render('quotations/job_details', { quotation, jobLines, tasks, intervalTypes });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.updateJobDetails = async (req, res) => {
    const { id } = req.params;
    const { lines } = req.body; // Expecting lines as object/array from form

    const trx = await db.transaction();
    try {
        // We will do a full replace logic or smart update. 
        // Given the complexity of splitting into Job and JobLine, let's process line by line.

        // Strategy: 
        // 1. Identify which lines are being kept.
        // 2. The form sends us lines which are "flat". We need to reconstruct the hierarchy.

        // Actually, the previous implementation in PHP was:
        // Loop through inputs. Check if Title+QuotationID exists in quotation_job. 
        // If yes, use it. If no, create it.
        // Then Create/Update quotation_job_line.

        // Since we are receiving a list of lines, let's first delete all lines for this quotation 
        // and recreate them to simplify, OR try to match.
        // Recreating is safer for consistency but loses IDs (if that matters).
        // Let's try to follow the PHP logic: "Check title".

        // First, let's delete lines that are NOT in the new list (if we had IDs).
        // But simplifying: let's clear existing lines for this quotation and rebuild.
        // Wait, multiple lines might share the same Title/Job parent.

        // Let's iterate the input lines.
        const linesArray = Array.isArray(lines) ? lines : (lines ? Object.values(lines) : []);

        // Remove existing lines and jobs for this quotation? 
        // If we delete jobs, we lose history if they are referenced elsewhere.
        // They are referenced by `quotation_job_line`.
        // `serviceplan` uses `quotation_job_id`. So we SHOULD NOT delete `quotation_job` lightly if it's already used.
        // However, this is "Service Job Details" for a quotation, usually done before Service Plan generation.

        // Safe approach:
        // 1. Loop inputs.
        // 2. Find/Create QuotationJob (Parent).
        // 3. Find/Create/Update QuotationJobLine (Child).

        // If the user removed a row in UI, we need to delete it in DB.
        // We can use a "keepIds" array.

        const keepLineIds = [];

        for (const line of linesArray) {
            if (!line.task_id) continue; // Skip empty rows

            // 1. Find or Create Parent Job
            let job = await trx('quotation_job')
                .where({ quotation_id: id, task_job_id: line.task_id }) // grouping by task_id matching title
                .first();

            if (!job) {
                const [jobId] = await trx('quotation_job').insert({
                    quotation_id: id,
                    title: line.title || '', // Should come from hidden input
                    task_job_id: line.task_id,
                    task_job_method_id: line.method_id || null, // This seems to be at Job level in legacy, but line level in form? 
                    // In legacy PHP: $model->task_job_method_id = $method[$i];
                    // It seems legacy creates a NEW Job for every line if the Title didn't exist?
                    // "chk_title = find()... if(chk_title)..."
                    // It groups by Title.
                    status: 1,
                    created_at: Math.floor(Date.now() / 1000),
                    created_by: req.session.user.id
                });
                job = { id: jobId };
            } else {
                // Update job method if needed? 
                // Legacy updates nothing on Job if found.
                // But wait, if we have multiple lines with SAME title but DIFFERENT methods...
                // The legacy code: `where(['quotation_id' => $quo_id, 'title' => $title[$i]])`
                // It groups strict text title. 
                // If I have "Termite Control" -> "Spray" and "Termite Control" -> "Baiting".
                // They share the same Job Parent "Termite Control".
                // So the Parent Job's `task_job_method_id` is ambiguous?
                // Legacy: `$model->task_job_method_id = $method[$i];` (only on create).
            }

            // 2. Find or Create Job Line
            let lineId = line.id;

            if (lineId) {
                // Update
                await trx('quotation_job_line').where({ id: lineId }).update({
                    quotation_job_id: job.id,
                    quotation_id: id, // Redundant but present in schema
                    description: line.description,
                    job_count: line.job_count || 0,
                    job_interval: line.job_interval || 0,
                    interval_type: line.interval_type || null,
                    status: 1
                });
                keepLineIds.push(lineId);
            } else {
                // Create
                const [newLineId] = await trx('quotation_job_line').insert({
                    quotation_job_id: job.id,
                    quotation_id: id,
                    description: line.description,
                    job_count: line.job_count || 0,
                    job_interval: line.job_interval || 0,
                    interval_type: line.interval_type || null,
                    status: 1
                });
                keepLineIds.push(newLineId);
            }
        }

        // Delete removed lines
        if (keepLineIds.length > 0) {
            await trx('quotation_job_line')
                .where({ quotation_id: id })
                .whereNotIn('id', keepLineIds)
                .delete();
        } else {
            // If no lines submitted (but we had lines before), delete all?
            // Only if the user genuinely removed them.
            if (linesArray.length === 0) {
                await trx('quotation_job_line').where({ quotation_id: id }).delete();
            }
        }

        // We should also clean up orphan QuotationJobs? 
        // (Jobs with no lines).
        // Let's skip that for now to avoid complexity, unless strictly needed.

        await trx.commit();
        res.redirect('/quotations/edit/' + id);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error saving job details');
    }
};

exports.getTaskMethods = async (req, res) => {
    try {
        const methods = await db('task_detail')
            .where('task_title_id', req.params.taskId)
            .select('id', 'task_method_name', 'description');
        res.json(methods);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getMethodDetail = async (req, res) => {
    try {
        const method = await db('task_detail')
            .where('id', req.params.methodId)
            .first();
        res.json(method || {});
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.printJob = async (req, res) => {
    const { id } = req.params;
    try {
        const quotation = await db('quotation as q')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .select('q.*', 'c.name as customer_name')
            .where('q.id', id)
            .first();

        // Join to get full info for each job line
        const jobLines = await db('quotation_job_line as qjl')
            .join('quotation_job as qj', 'qjl.quotation_job_id', 'qj.id')
            .leftJoin('task as t', 'qj.task_job_id', 't.id')
            .leftJoin('task_detail as td', 'qj.task_job_method_id', 'td.id')
            .where('qjl.quotation_id', id)
            .select(
                'qjl.*',
                'qj.title as job_title',
                't.title as task_title',
                'td.task_method_name'
            );

        const company = await db('company').first();

        res.render('quotations/print_job', { quotation, jobLines, company, layout: false });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.approve = async (req, res) => {
    const { id } = req.params;
    try {
        await db('quotation').where({ id }).update({
            status: 2, // Approved
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/quotations/edit/' + id);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error approving quotation');
    }
};

exports.createContract = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        const quotation = await trx('quotation').where({ id }).first();
        if (!quotation) throw new Error('Quotation not found');

        // Check if contract already exists
        const existing = await trx('contract').where({ quotation_id: id }).first();
        if (existing) {
            await trx.rollback();
            return res.redirect('/contracts/edit/' + existing.id);
        }

        // Generate Contract No
        const date = new Date();
        const prefix = 'CT' + date.getFullYear().toString().substr(-2);
        const last = await trx('contract').where('contract_no', 'like', prefix + '%').orderBy('contract_no', 'desc').first();
        let nextNum = 1;
        if (last && last.contract_no) {
            const lastNum = parseInt(last.contract_no.substr(-5));
            if (!isNaN(lastNum)) nextNum = lastNum + 1;
        }
        const contractNo = prefix + '-' + nextNum.toString().padStart(5, '0');

        const [contractId] = await trx('contract').insert({
            contract_no: contractNo,
            contract_date: new Date(),
            quotation_id: id,
            status: 1, // Active/Draft
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        // Create Job Card
        const lastJobCard = await trx('job_card').orderBy('id', 'desc').first();
        let nextJCNum = 1;
        if (lastJobCard && lastJobCard.job_card_no) {
            const num = parseInt(lastJobCard.job_card_no.replace(/[^0-9]/g, ''));
            if (!isNaN(num)) nextJCNum = num + 1;
        }
        const jobCardNo = 'JC' + nextJCNum.toString().padStart(5, '0');

        await trx('job_card').insert({
            job_card_no: jobCardNo,
            contract_id: contractId,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        // Update quotation status
        await trx('quotation').where({ id }).update({ status: 3 }); // Contracted

        await trx.commit();
        res.redirect('/contracts/edit/' + contractId);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating contract: ' + err.message);
    }
};

exports.createPlan = async (req, res) => {
    const { id } = req.params; // Quotation ID
    const trx = await db.transaction();
    try {
        const quotation = await trx('quotation').where({ id }).first();
        const contract = await trx('contract').where({ quotation_id: id }).first();

        if (!contract) {
            await trx.rollback();
            return res.status(400).send('No contract found for this quotation. Create contract first.');
        }

        const jobLines = await trx('quotation_job_line').where({ quotation_id: id });

        for (const line of jobLines) {
            const loops = line.job_interval || 0;
            const freqCount = line.job_count || 1;
            const freqUnit = line.interval_type; // 1: day, 2: week, 3: month, 4: year

            let currentDate = new Date();
            // Often we start from contract_start_date if available
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
                    quotation_id: id,
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
        res.redirect('/service-plans?quotation_id=' + id);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error generating plans');
    }
};



exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('quotation as q')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .leftJoin('service_type as st', 'q.service_type_id', 'st.id');

        let query = db('quotation as q')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .leftJoin('service_type as st', 'q.service_type_id', 'st.id')
            .select('q.*', 'c.name as customer_name', 'st.name as service_type_name')
            .orderBy('q.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('q.quotation_no', 'like', `%${search}%`)
                    .orWhere('q.service_name', 'like', `%${search}%`)
                    .orWhere('c.name', 'like', `%${search}%`)
                    .orWhere('st.name', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('q.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('quotations/index', {
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
        const customers = await db('customer').select('id', 'name');
        const serviceTypes = await db('service_type').select('id', 'name');
        const employees = await db('employee').select('id', 'fname', 'lname');
        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');

        res.render('quotations/create', { customers, serviceTypes, employees, products, units });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const {
        quotation_no, quotation_date, customer_id, service_type_id,
        sale_emp_id, credit_term, sub_total, amount, sale_tax, total,
        note, service_name, lines
    } = req.body;

    const trx = await db.transaction();
    try {
        const [id] = await trx('quotation').insert({
            quotation_no,
            quotation_date: quotation_date || null,
            customer_id: customer_id || null,
            service_type_id: service_type_id || null,
            sale_emp_id: sale_emp_id || null,
            credit_term: credit_term || 0,
            sub_total: sub_total || 0,
            amount: amount || 0,
            sale_tax: sale_tax || 0,
            total: total || 0,
            note,
            service_name,
            status: 1,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                quotation_id: id,
                item_id: line.item_id,
                name: line.name || '',
                price_per_unit: line.price_per_unit || 0,
                unit_id: line.unit_id || null,
                qty: line.qty || 0,
                line_total: line.line_total || 0,
                status: 1
            }));
            await trx('quotation_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/quotations');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating quotation');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('quotation').where({ id }).first();
        const lines = await db('quotation_line as ql')
            .leftJoin('product as p', 'ql.item_id', 'p.id')
            .select('ql.*', 'p.name as item_name', 'p.code as item_code')
            .where('ql.quotation_id', id);

        const customers = await db('customer').select('id', 'name');
        const serviceTypes = await db('service_type').select('id', 'name');
        const employees = await db('employee').select('id', 'fname', 'lname');
        const products = await db('product').select('id', 'name', 'code');
        const units = await db('unit').select('id', 'name');

        const contract = await db('contract').where({ quotation_id: id }).first();

        res.render('quotations/edit', { item, lines, customers, serviceTypes, employees, products, units, contract });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const {
        quotation_no, quotation_date, customer_id, service_type_id,
        sale_emp_id, credit_term, sub_total, amount, sale_tax, total,
        note, service_name, lines
    } = req.body;

    const trx = await db.transaction();
    try {
        await trx('quotation').where({ id }).update({
            quotation_no,
            quotation_date: quotation_date || null,
            customer_id: customer_id || null,
            service_type_id: service_type_id || null,
            sale_emp_id: sale_emp_id || null,
            credit_term: credit_term || 0,
            sub_total: sub_total || 0,
            amount: amount || 0,
            sale_tax: sale_tax || 0,
            total: total || 0,
            note,
            service_name,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });

        await trx('quotation_line').where({ quotation_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.map(line => ({
                quotation_id: id,
                item_id: line.item_id,
                name: line.name || '',
                price_per_unit: line.price_per_unit || 0,
                unit_id: line.unit_id || null,
                qty: line.qty || 0,
                line_total: line.line_total || 0,
                status: 1
            }));
            await trx('quotation_line').insert(lineData);
        }

        await trx.commit();
        res.redirect('/quotations');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating quotation');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('quotation_line').where({ quotation_id: id }).delete();
        await trx('quotation').where({ id }).delete();
        await trx.commit();
        res.redirect('/quotations');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting quotation');
    }
};

exports.copy = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        // 1. Fetch original quotation
        const original = await trx('quotation').where({ id }).first();
        if (!original) throw new Error('Quotation not found');

        // 2. Fetch original lines
        const lines = await trx('quotation_line').where({ quotation_id: id });

        // 3. Generate new Quotation No (Simple implementation)
        // You might want to make a proper helper for this
        const date = new Date();
        const prefix = 'QT' + date.getFullYear().toString().substr(-2) + (date.getMonth() + 1).toString().padStart(2, '0');
        const last = await trx('quotation').where('quotation_no', 'like', prefix + '%').orderBy('quotation_no', 'desc').first();
        let newNo = prefix + '0001';
        if (last) {
            const lastNum = parseInt(last.quotation_no.substr(-4));
            newNo = prefix + (lastNum + 1).toString().padStart(4, '0');
        }

        // 4. Create new quotation
        const [newId] = await trx('quotation').insert({
            quotation_no: newNo,
            quotation_date: new Date(), // Today
            customer_id: original.customer_id,
            service_type_id: original.service_type_id,
            sale_emp_id: original.sale_emp_id,
            credit_term: original.credit_term,
            sub_total: original.sub_total,
            amount: original.amount,
            sale_tax: original.sale_tax,
            total: original.total,
            note: original.note,
            service_name: original.service_name,
            status: 1, // Draft
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });

        // 5. Copy lines
        if (lines.length > 0) {
            const newLineData = lines.map(line => ({
                quotation_id: newId,
                item_id: line.item_id,
                name: line.name,
                price_per_unit: line.price_per_unit,
                unit_id: line.unit_id,
                qty: line.qty,
                line_total: line.line_total,
                status: 1
            }));
            await trx('quotation_line').insert(newLineData);
        }

        await trx.commit();
        res.redirect('/quotations/edit/' + newId);
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error copying quotation: ' + err.message);
    }
};

exports.print = async (req, res) => {
    const { id } = req.params;
    try {
        const quotation = await db('quotation as q')
            .leftJoin('customer as c', 'q.customer_id', 'c.id')
            .leftJoin('service_type as st', 'q.service_type_id', 'st.id')
            .leftJoin('employee as e', 'q.sale_emp_id', 'e.id')
            .select('q.*', 'c.name as customer_name', 'c.address as customer_address', 'c.phone as customer_phone', 'st.name as service_type_name', 'e.fname as sale_fname', 'e.lname as sale_lname')
            .where('q.id', id)
            .first();

        const lines = await db('quotation_line as ql')
            .leftJoin('unit as u', 'ql.unit_id', 'u.id')
            .select('ql.*', 'u.name as unit_name')
            .where('ql.quotation_id', id);

        const company = await db('company').first();

        res.render('quotations/print', { quotation, lines, company, layout: false });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};
