const db = require('../config/db');
const bcrypt = require('bcryptjs');

exports.loginPage = (req, res) => {
    if (req.session.user) return res.redirect('/dashboard');
    res.render('login', { error: null });
};

exports.login = async (req, res) => {
    const { username, password } = req.body;
    try {
        const user = await db('user').where({ username }).first();
        if (user && await bcrypt.compare(password, user.password_hash)) {
            req.session.user = { id: user.id, username: user.username };
            return res.redirect('/dashboard');
        }
        res.render('login', { error: 'Invalid username or password' });
    } catch (err) {
        console.error(err);
        res.render('login', { error: 'Something went wrong' });
    }
};

exports.logout = (req, res) => {
    req.session.destroy();
    res.redirect('/login');
};
