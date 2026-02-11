const express = require('express');
const router = express.Router();
const controller = require('../controllers/StockCountController');

router.get('/', controller.index);
router.post('/add', controller.add);
router.get('/view/:id', controller.view);
router.post('/view/:id', controller.saveLines);
router.get('/delete/:id', controller.delete);

module.exports = router;
