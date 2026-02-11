const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = 20;
        const offset = (page - 1) * limit;

        const items = await db('work_task')
            .select('*')
            .orderBy('id', 'desc')
            .limit(limit)
            .offset(offset);

        const totalQuery = await db('work_task').count('* as count');
        const total = totalQuery[0].count;
        const totalPages = Math.ceil(total / limit);

        res.render('work-tasks/index', {
            items,
            pagination: { page, totalPages, total }
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.create = async (req, res) => {
    try {
        // Fetch products for the dropdown
        const products = await db('product').select('id', 'code', 'name', 'price').where('status', 1);
        res.render('work-tasks/create', { products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.store = async (req, res) => {
    const { code, name, description, lines } = req.body;
    const trx = await db.transaction();
    try {
        const [id] = await trx('work_task').insert({
            code: code || '',
            name: name || '',
            description: description || '',
            status: 1,
            created_by: req.session.user ? req.session.user.id : 1,
            created_at: Math.floor(Date.now() / 1000),
            updated_at: Math.floor(Date.now() / 1000)
        });

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                work_task_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1,
                created_at: Math.floor(Date.now() / 1000)
            }));

            if (lineData.length > 0) {
                await trx('work_task_detail').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect('/work-tasks');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error creating Work Task');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    try {
        const item = await db('work_task').where({ id }).first();
        if (!item) {
            return res.status(404).send('Not Found');
        }

        const lines = await db('work_task_detail as wtd')
            .leftJoin('product as p', 'wtd.product_id', 'p.id')
            .select('wtd.*', 'p.code as product_code', 'p.name as product_name')
            .where({ work_task_id: id });

        const products = await db('product').select('id', 'code', 'name', 'price').where('status', 1);

        res.render('work-tasks/edit', { item, lines, products });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.update = async (req, res) => {
    const { id } = req.params;
    const { code, name, description, lines } = req.body;
    const trx = await db.transaction();
    try {
        await trx('work_task').where({ id }).update({
            code: code || '',
            name: name || '',
            description: description || '',
            updated_by: req.session.user ? req.session.user.id : 1,
            updated_at: Math.floor(Date.now() / 1000)
        });

        // Replace all lines (simplest approach for now)
        await trx('work_task_detail').where({ work_task_id: id }).delete();

        if (lines && Array.isArray(lines)) {
            const lineData = lines.filter(l => l.product_id).map(line => ({
                work_task_id: id,
                product_id: line.product_id,
                qty: line.qty || 0,
                price: line.price || 0,
                line_total: (line.qty || 0) * (line.price || 0),
                status: 1,
                created_at: Math.floor(Date.now() / 1000)
            }));

            if (lineData.length > 0) {
                await trx('work_task_detail').insert(lineData);
            }
        }

        await trx.commit();
        res.redirect('/work-tasks');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error updating Work Task');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    const trx = await db.transaction();
    try {
        await trx('work_task_detail').where({ work_task_id: id }).delete();
        await trx('work_task').where({ id }).delete();
        await trx.commit();
        res.redirect('/work-tasks');
    } catch (err) {
        await trx.rollback();
        console.error(err);
        res.status(500).send('Error deleting Work Task');
    }
};
