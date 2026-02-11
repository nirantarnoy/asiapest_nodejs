const express = require('express');
const router = express.Router();
const importController = require('../controllers/ImportController');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, importController.index);

// New Export Pattern routes
router.get('/export-customer-pattern', isAuthenticated, importController.exportCustomerPattern);
router.get('/export-employee-pattern', isAuthenticated, importController.exportEmployeePattern);
router.get('/export-product-pattern', isAuthenticated, importController.exportProductPattern);

router.post('/customer', isAuthenticated, upload.single('file_customer'), importController.importCustomer);
router.post('/employee', isAuthenticated, upload.single('file_employee'), importController.importEmployee);
router.post('/product', isAuthenticated, upload.single('file_product'), importController.importProduct);

module.exports = router;
