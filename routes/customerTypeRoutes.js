const express = require('express');
const router = express.Router();
const customerTypeController = require('../controllers/CustomerTypeController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', customerTypeController.index);
router.post('/add', customerTypeController.add);
router.post('/edit/:id', customerTypeController.edit);
router.get('/delete/:id', customerTypeController.delete);

module.exports = router;
