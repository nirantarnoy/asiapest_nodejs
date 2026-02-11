const express = require('express');
const router = express.Router();
const vendorController = require('../controllers/VendorController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, vendorController.index);
router.get('/create', isAuthenticated, vendorController.create);
router.post('/create', isAuthenticated, vendorController.store);
router.get('/edit/:id', isAuthenticated, vendorController.edit);
router.post('/edit/:id', isAuthenticated, vendorController.update);
router.get('/delete/:id', isAuthenticated, vendorController.delete);

module.exports = router;
