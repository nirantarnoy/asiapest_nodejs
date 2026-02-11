const express = require('express');
const router = express.Router();
const dashboardController = require('../controllers/DashboardController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, dashboardController.index);
router.post('/find-event', isAuthenticated, dashboardController.findEvent);
router.post('/add-event', isAuthenticated, dashboardController.storeEvent);

module.exports = router;
