const express = require('express');
const router = express.Router();
const carController = require('../controllers/CarController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', carController.index);
router.post('/add', carController.add);
router.post('/edit/:id', carController.edit);
router.get('/delete/:id', carController.delete);

module.exports = router;
