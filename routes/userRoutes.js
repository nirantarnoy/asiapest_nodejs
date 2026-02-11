const express = require('express');
const router = express.Router();
const userController = require('../controllers/UserController');

// Middleware to check if logged in
const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', userController.index);
router.post('/add', userController.add);
router.post('/edit/:id', userController.edit);
router.get('/delete/:id', userController.delete);

module.exports = router;
