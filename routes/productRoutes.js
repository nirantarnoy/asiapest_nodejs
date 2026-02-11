const express = require('express');
const router = express.Router();
const productController = require('../controllers/ProductController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', productController.index);
router.post('/add', productController.add);
router.post('/edit/:id', productController.edit);
router.get('/delete/:id', productController.delete);

module.exports = router;
