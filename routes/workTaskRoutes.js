const express = require('express');
const router = express.Router();
const controller = require('../controllers/WorkTaskController');

router.get('/', controller.index);
router.get('/create', controller.create);
router.post('/create', controller.store);
router.get('/edit/:id', controller.edit);
router.post('/update/:id', controller.update);
router.get('/delete/:id', controller.delete);

module.exports = router;
