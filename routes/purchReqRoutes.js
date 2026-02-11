const express = require('express');
const router = express.Router();
const purchReqController = require('../controllers/PurchReqController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, purchReqController.index);
router.get('/create', isAuthenticated, purchReqController.create);
router.post('/create', isAuthenticated, purchReqController.store);
router.get('/edit/:id', isAuthenticated, purchReqController.edit);
router.post('/edit/:id', isAuthenticated, purchReqController.update);
router.get('/delete/:id', isAuthenticated, purchReqController.delete);
router.get('/print/:id', isAuthenticated, purchReqController.print);
router.get('/approve/:id', isAuthenticated, purchReqController.approve);

module.exports = router;
