const express = require('express');
const router = express.Router();
const customerGroupController = require('../controllers/CustomerGroupController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', customerGroupController.index);
router.post('/add', customerGroupController.add);
router.post('/edit/:id', customerGroupController.edit);
router.get('/delete/:id', customerGroupController.delete);

module.exports = router;
