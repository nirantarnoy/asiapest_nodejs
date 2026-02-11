const express = require('express');
const router = express.Router();
const paymentMethodController = require('../controllers/PaymentMethodController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, paymentMethodController.index);
router.post('/add', isAuthenticated, paymentMethodController.add);
router.post('/edit/:id', isAuthenticated, paymentMethodController.edit);
router.get('/delete/:id', isAuthenticated, paymentMethodController.delete);

module.exports = router;
