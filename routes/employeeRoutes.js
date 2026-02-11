const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/EmployeeController');

const isAuthenticated = (req, res, next) => {
    if (req.session.user) return next();
    res.redirect('/login');
};

router.use(isAuthenticated);

router.get('/', employeeController.index);
router.post('/add', employeeController.add);
router.post('/edit/:id', employeeController.edit);
router.get('/delete/:id', employeeController.delete);

module.exports = router;
