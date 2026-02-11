const express = require('express');
const router = express.Router();
const estimatePriceController = require('../controllers/EstimatePriceController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, estimatePriceController.index);
router.get('/create', isAuthenticated, estimatePriceController.create);
router.post('/add', isAuthenticated, estimatePriceController.store);
router.get('/edit/:id', isAuthenticated, estimatePriceController.edit);
router.post('/edit/:id', isAuthenticated, estimatePriceController.update);
router.get('/delete/:id', isAuthenticated, estimatePriceController.delete);

router.get('/approve/:id', isAuthenticated, estimatePriceController.approve);
router.get('/confirm-service/:id', isAuthenticated, estimatePriceController.confirmToService);

module.exports = router;
