const express = require('express');
const router = express.Router();
const jobCardController = require('../controllers/JobCardController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, jobCardController.index);
router.get('/create', isAuthenticated, jobCardController.create);
router.post('/add', isAuthenticated, jobCardController.store);
router.get('/edit/:id', isAuthenticated, jobCardController.edit);
router.post('/edit/:id', isAuthenticated, jobCardController.update);
router.get('/delete/:id', isAuthenticated, jobCardController.delete);
router.get('/print/:id', isAuthenticated, jobCardController.print);

module.exports = router;
