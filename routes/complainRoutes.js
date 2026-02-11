const express = require('express');
const router = express.Router();
const complainController = require('../controllers/ComplainController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, complainController.index);
router.get('/create', isAuthenticated, complainController.create);
router.post('/add', isAuthenticated, complainController.store);
router.get('/edit/:id', isAuthenticated, complainController.edit);
router.post('/edit/:id', isAuthenticated, complainController.update);
router.get('/delete/:id', isAuthenticated, complainController.delete);

module.exports = router;
