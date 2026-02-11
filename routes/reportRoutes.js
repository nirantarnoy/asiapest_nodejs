const express = require('express');
const router = express.Router();
const reportController = require('../controllers/ReportController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/stock-movement', isAuthenticated, reportController.stockMovement);
router.get('/sales', isAuthenticated, reportController.salesReport);

module.exports = router;
