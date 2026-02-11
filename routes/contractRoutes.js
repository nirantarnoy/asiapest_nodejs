const express = require('express');
const router = express.Router();
const contractController = require('../controllers/ContractController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, contractController.index);
router.get('/create', isAuthenticated, contractController.create);
router.post('/add', isAuthenticated, contractController.store);
router.get('/edit/:id', isAuthenticated, contractController.edit);
router.post('/edit/:id', isAuthenticated, contractController.update);
router.get('/delete/:id', isAuthenticated, contractController.delete);
router.get('/print/:id', isAuthenticated, contractController.print);
router.get('/gen-plan/:id', isAuthenticated, contractController.generatePlan);
router.get('/approve/:id', isAuthenticated, contractController.approve);
router.get('/timeline/:id', isAuthenticated, contractController.timeline);

module.exports = router;
