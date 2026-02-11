const db = require('../config/db');

exports.accessLogs = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = 50;
        const offset = (page - 1) * limit;

        const logs = await db('access_log as al')
            .leftJoin('user as u', 'al.user_id', 'u.id')
            .select('al.*', 'u.username')
            .orderBy('al.created_at', 'desc')
            .limit(limit)
            .offset(offset);

        const countResult = await db('access_log').count('id as total').first();
        const total = countResult.total;
        const totalPages = Math.ceil(total / limit);

        res.render('logs/access', {
            logs,
            currentPage: page,
            totalPages,
            totalItems: total
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.actionLogs = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = 50;
        const offset = (page - 1) * limit;

        const logs = await db('action_log as al')
            .leftJoin('user as u', 'al.user_id', 'u.id')
            .select('al.*', 'u.username')
            .orderBy('al.created_at', 'desc')
            .limit(limit)
            .offset(offset);

        const countResult = await db('action_log').count('id as total').first();
        const total = countResult.total;
        const totalPages = Math.ceil(total / limit);

        res.render('logs/action', {
            logs,
            currentPage: page,
            totalPages,
            totalItems: total
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};
