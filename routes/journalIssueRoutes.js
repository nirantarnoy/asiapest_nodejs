const express = require('express');
const router = express.Router();
const journalIssueController = require('../controllers/JournalIssueController');
const { can } = require('../middlewares/rbac');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, can('journalissue'), journalIssueController.index);
router.get('/create', isAuthenticated, can('journalissue/create'), journalIssueController.create);
router.post('/create', isAuthenticated, can('journalissue/create'), journalIssueController.store);
router.get('/api/warehouse-stock/:warehouse_id', isAuthenticated, can('journalissue'), journalIssueController.getWarehouseStock);
router.get('/delete/:id', isAuthenticated, can('journalissue/delete/:id'), journalIssueController.delete);
router.get('/print/:id', isAuthenticated, can('journalissue/print/:id'), journalIssueController.print);

module.exports = router;
