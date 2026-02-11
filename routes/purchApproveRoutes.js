const express = require('express');
const router = express.Router();
const purchApproveController = require('../controllers/PurchApproveController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, purchApproveController.index);

module.exports = router;
