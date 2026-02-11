const express = require('express');
const router = express.Router();
const serviceController = require('../controllers/ServiceController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, serviceController.index);
router.get('/view/:id', isAuthenticated, serviceController.view);
router.get('/edit/:id', isAuthenticated, serviceController.showEdit);
router.post('/edit/:id', isAuthenticated, serviceController.update);
router.get('/print/:id', isAuthenticated, serviceController.print);
router.get('/delete/:id', isAuthenticated, serviceController.delete);
router.get('/create-issue/:id', isAuthenticated, serviceController.createIssue);

module.exports = router;
