const db = require('../config/db');

exports.index = async (req, res) => {
    try {
        const items = await db('customer_group').select('*');
        res.render('customer-groups/index', { items, activePage: 'customers' }); // Grouped under customer in sidebar
    } catch (err) {
        console.error(err);
        res.status(500).send('Database Error');
    }
};

exports.add = async (req, res) => {
    const { code, name, description } = req.body;
    try {
        await db('customer_group').insert({
            code,
            name,
            description,
            created_by: req.session.user.id
        });
        res.redirect('/customer-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding item');
    }
};

exports.edit = async (req, res) => {
    const { id } = req.params;
    const { code, name, description } = req.body;
    try {
        await db('customer_group').where({ id }).update({
            code,
            name,
            description,
            updated_by: req.session.user.id
        });
        res.redirect('/customer-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating item');
    }
};

exports.delete = async (req, res) => {
    const { id } = req.params;
    try {
        await db('customer_group').where({ id }).delete();
        res.redirect('/customer-groups');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting item');
    }
};
