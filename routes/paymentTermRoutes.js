const express = require('express');
const router = express.Router();
const paymentTermController = require('../controllers/PaymentTermController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, paymentTermController.index);
router.post('/add', isAuthenticated, paymentTermController.add);
router.post('/edit/:id', isAuthenticated, paymentTermController.edit);
router.get('/delete/:id', isAuthenticated, paymentTermController.delete);

module.exports = router;
