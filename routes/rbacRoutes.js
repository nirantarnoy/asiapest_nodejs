const express = require('express');
const router = express.Router();
const rbacController = require('../controllers/RbacController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/roles', isAuthenticated, rbacController.roles);
router.get('/permissions/:roleName', isAuthenticated, rbacController.rolePermissions);
router.post('/permissions/:roleName', isAuthenticated, rbacController.updateRolePermissions);

module.exports = router;
