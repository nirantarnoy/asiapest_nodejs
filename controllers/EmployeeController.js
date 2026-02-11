const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('employee as e')
            .leftJoin('position as p', 'e.position', 'p.id');

        let query = db('employee as e')
            .leftJoin('position as p', 'e.position', 'p.id')
            .select('e.*', 'p.name as position_name')
            .orderBy('e.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('e.code', 'like', `%${search}%`)
                    .orWhere('e.fname', 'like', `%${search}%`)
                    .orWhere('e.lname', 'like', `%${search}%`)
                    .orWhere('p.name', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('e.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const employees = await query;
        const positions = await db('position').select('id', 'name');
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('employees/index', {
            employees,
            positions,
            activePage: 'employee',
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
    const { code, fname, lname, position, gender, salary_type, emp_start } = req.body;
    try {
        await db('employee').insert({
            code, fname, lname, position, gender, salary_type, emp_start,
            created_by: req.session.user.id,
            created_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding employee');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, fname, lname, position, gender, salary_type, emp_start } = req.body;
    try {
        await db('employee').where({ id }).update({
            code, fname, lname, position, gender, salary_type, emp_start,
            updated_by: req.session.user.id,
            updated_at: Math.floor(Date.now() / 1000)
        });
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating employee');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('employee').where({ id }).delete();
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting employee');
    }
};
