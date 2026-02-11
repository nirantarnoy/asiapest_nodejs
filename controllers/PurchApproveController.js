const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('purch_req as pr')
            .leftJoin('user as u', 'pr.created_by', 'u.id')
            .where('pr.status', 4); // Only approved

        let query = db('purch_req as pr')
            .leftJoin('user as u', 'pr.created_by', 'u.id')
            .select('pr.*', 'u.username as creator_name')
            .where('pr.status', 4) // Only approved
            .orderBy('pr.id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('pr.purch_req_no', 'like', `%${search}%`)
                    .orWhere('pr.note', 'like', `%${search}%`)
                    .orWhere('u.username', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('pr.id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const items = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('purch-approve/index', {
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
