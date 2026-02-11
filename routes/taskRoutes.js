const express = require('express');
const router = express.Router();
const taskController = require('../controllers/TaskController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

router.get('/', isAuthenticated, taskController.index);
router.post('/add', isAuthenticated, taskController.add);
router.post('/edit/:id', isAuthenticated, taskController.edit);
router.get('/delete/:id', isAuthenticated, taskController.delete);

module.exports = router;
