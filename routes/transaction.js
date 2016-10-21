const express = require('express');
const router = express.Router();

const Transaction = require('../database/transactionDB')

router.get( '/', ( request, response ) => {
  Promise.all([ Transaction.getAll() ])
  .then( transactions => response.render( 'transaction/index', { transactions: transactions[0] } ))
})


module.exports = router
