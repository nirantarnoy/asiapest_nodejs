const express = require('express');
const router = express.Router();
const carTypeController = require('../controllers/CarTypeController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', carTypeController.index);
router.post('/add', carTypeController.add);
router.post('/edit/:id', carTypeController.edit);
router.get('/delete/:id', carTypeController.delete);

module.exports = router;
