const express = require('express');
const router = express.Router();
const companyController = require('../controllers/CompanyController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, companyController.index);
router.post('/add', isAuthenticated, companyController.add);
router.post('/edit/:id', isAuthenticated, companyController.edit);
router.get('/delete/:id', isAuthenticated, companyController.delete);

module.exports = router;
