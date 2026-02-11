const express = require('express');
const router = express.Router();
const positionController = require('../controllers/PositionController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', positionController.index);
router.post('/add', positionController.add);
router.post('/edit/:id', positionController.edit);
router.get('/delete/:id', positionController.delete);

module.exports = router;
