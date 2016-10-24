const express = require('express')
const router = express.Router()
const { Payment } = require( '../database/paymentDB' )

router.get( '/', (request, response ) => {

  Promise.all([ Payment.getAll() ])
  .then( data => response.send( data ) )


})

module.exports = router;
