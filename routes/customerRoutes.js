const express = require('express');
const router = express.Router();
const customerController = require('../controllers/CustomerController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', customerController.index);
router.post('/add', customerController.add);
router.post('/edit/:id', customerController.edit);
router.get('/delete/:id', customerController.delete);

module.exports = router;
