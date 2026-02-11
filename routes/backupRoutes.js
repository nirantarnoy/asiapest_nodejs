const express = require('express');
const router = express.Router();
const backupController = require('../controllers/BackupController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.get('/', isAuthenticated, backupController.index);
router.post('/run', isAuthenticated, backupController.runManualBackup);
router.post('/settings', isAuthenticated, backupController.updateSettings);
router.get('/download/:fileName', isAuthenticated, backupController.download);
router.get('/delete/:fileName', isAuthenticated, backupController.delete);

module.exports = router;
