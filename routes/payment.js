const express = require('express');
const router = express.Router();

/* GET users listing. */
router.get('/', (request, response ) => {
  response.send('route for payment');
});

module.exports = router;
