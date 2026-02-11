const express = require('express');
const router = express.Router();
const controller = require('../controllers/LocationController');

router.get('/', controller.index);
router.post('/add', controller.add);
router.post('/edit/:id', controller.edit);
router.get('/delete/:id', controller.delete);

module.exports = router;
