const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/', ( request, response ) => {
  response.send('Route for custom_pizzas.')
});

module.exports = router;
