const express = require('express');
const router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('route for specialty_pizza');
});

module.exports = router;
