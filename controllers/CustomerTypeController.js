const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const items = await db('customer_type').select('*');
        res.render('customer-types/index', { items, activePage: 'customers' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.add = async (req, res) => {
    const { code, name, description } = req.body;
    try {
        await db('customer_type').insert({
            code,
            name,
            description,
            created_by: req.session.user.id
        });
        res.redirect('/customer-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding item');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        await db('customer_type').where({ id }).update({
            code,
            name,
            description,
            updated_by: req.session.user.id
        });
        res.redirect('/customer-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating item');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('customer_type').where({ id }).delete();
        res.redirect('/customer-types');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting item');
    }
};
