const express = require('express');
const router = express.Router();
const journalIssueController = require('../controllers/JournalIssueController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, journalIssueController.index);
router.get('/create', isAuthenticated, journalIssueController.create);
router.post('/create', isAuthenticated, journalIssueController.store);
router.get('/api/warehouse-stock/:warehouse_id', isAuthenticated, journalIssueController.getWarehouseStock);
router.get('/delete/:id', isAuthenticated, journalIssueController.delete);
router.get('/print/:id', isAuthenticated, journalIssueController.print);

module.exports = router;
