const express = require('express');
const router = express.Router();
const controller = require('../controllers/StockSumController');

router.get('/', controller.index);

module.exports = router;
