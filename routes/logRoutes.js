const express = require('express');
const router = express.Router();
const logController = require('../controllers/LogController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/access', isAuthenticated, logController.accessLogs);
router.get('/action', isAuthenticated, logController.actionLogs);

module.exports = router;
