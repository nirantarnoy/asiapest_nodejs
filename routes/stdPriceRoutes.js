const express = require('express');
const router = express.Router();
const stdPriceController = require('../controllers/StdPriceController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, stdPriceController.index);
router.get('/create', isAuthenticated, stdPriceController.create);
router.post('/add', isAuthenticated, stdPriceController.store);
router.get('/edit/:id', isAuthenticated, stdPriceController.edit);
router.post('/edit/:id', isAuthenticated, stdPriceController.update);
router.get('/delete/:id', isAuthenticated, stdPriceController.delete);

module.exports = router;
