const express = require('express');
const router = express.Router();
const serviceTypeController = require('../controllers/ServiceTypeController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, serviceTypeController.index);
router.post('/add', isAuthenticated, serviceTypeController.add);
router.post('/edit/:id', isAuthenticated, serviceTypeController.edit);
router.get('/delete/:id', isAuthenticated, serviceTypeController.delete);

module.exports = router;
