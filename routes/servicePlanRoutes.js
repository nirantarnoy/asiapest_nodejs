const express = require('express');
const router = express.Router();
const servicePlanController = require('../controllers/ServicePlanController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, servicePlanController.index);
router.get('/create', isAuthenticated, servicePlanController.create);
router.post('/add', isAuthenticated, servicePlanController.store);
router.get('/edit/:id', isAuthenticated, servicePlanController.edit);
router.post('/edit/:id', isAuthenticated, servicePlanController.update);
router.get('/delete/:id', isAuthenticated, servicePlanController.delete);
router.get('/print/:id', isAuthenticated, servicePlanController.print);

module.exports = router;
