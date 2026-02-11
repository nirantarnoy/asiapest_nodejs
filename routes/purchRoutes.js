const express = require('express');
const router = express.Router();
const purchController = require('../controllers/PurchController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, purchController.index);
router.get('/create', isAuthenticated, purchController.create);
router.post('/create', isAuthenticated, purchController.store);
router.get('/edit/:id', isAuthenticated, purchController.edit);
router.post('/edit/:id', isAuthenticated, purchController.update);
router.get('/delete/:id', isAuthenticated, purchController.delete);
router.get('/print/:id', isAuthenticated, purchController.print);
router.get('/receive/:id', isAuthenticated, purchController.receiveItems);
router.post('/save-receive', isAuthenticated, purchController.saveReceive);

module.exports = router;
