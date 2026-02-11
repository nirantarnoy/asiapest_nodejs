const db = require('../config/db');
const bcrypt = require('bcryptjs');

exports.index = async (req, res) => {
    try {
        const page = parseInt(req.query.page) || 1;
        const limit = req.query.limit === 'all' ? null : parseInt(req.query.limit) || 20;
        const search = req.query.search || '';

        // Build base query
        let countQuery = db('user');
        let query = db('user').orderBy('id', 'desc');

        // Apply search filter
        if (search) {
            const searchCondition = (builder) => {
                builder
                    .where('username', 'like', `%${search}%`)
                    .orWhere('email', 'like', `%${search}%`);
            };
            query.where(searchCondition);
            countQuery.where(searchCondition);
        }

        const totalQuery = await countQuery.count('id as count');
        const total = totalQuery[0].count;

        if (limit) {
            const offset = (page - 1) * limit;
            query = query.limit(limit).offset(offset);
        }

        const users = await query;
        const totalPages = limit ? Math.ceil(total / limit) : 1;

        res.render('users/index', {
            users,
            activePage: 'users',
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
    const { username, password, email } = req.body;
    try {
        const password_hash = await bcrypt.hash(password, 10);
        await db('user').insert({ username, password_hash, email });
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding user');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { username, email } = req.body;
    try {
        await db('user').where({ id }).update({ username, email });
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating user');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('user').where({ id }).delete();
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting user');
    }
};
