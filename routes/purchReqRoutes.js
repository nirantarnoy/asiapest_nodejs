const express = require('express');
const router = express.Router();
const purchReqController = require('../controllers/PurchReqController');
const { can } = require('../middlewares/rbac');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, can('purchreq'), purchReqController.index);
router.get('/create', isAuthenticated, can('purchreq/create'), purchReqController.create);
router.post('/create', isAuthenticated, can('purchreq/create'), purchReqController.store);
router.get('/api/warehouse-stock/:warehouse_id', isAuthenticated, can('purchreq'), purchReqController.getWarehouseStock);
router.get('/edit/:id', isAuthenticated, can('purchreq/edit/:id'), purchReqController.edit);
router.post('/edit/:id', isAuthenticated, can('purchreq/edit/:id'), purchReqController.update);
router.get('/delete/:id', isAuthenticated, can('purchreq/delete/:id'), purchReqController.delete);
router.get('/print/:id', isAuthenticated, can('purchreq/print/:id'), purchReqController.print);
router.get('/approve/:id', isAuthenticated, can('purchreq/approve/:id'), purchReqController.approve);

module.exports = router;
