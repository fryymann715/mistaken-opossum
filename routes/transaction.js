const express = require( 'express' )
const router = express.Router()

const Transaction = require( '../database/transactionDB' )
const { Payment } = require( '../database/paymentDB' )

router.get( '/', ( request, response ) => {
  Promise.all([ Transaction.getAll() ])
  .then( transactions => response.render( 'transaction/index', { transactions: transactions[0] } ))
})

router.get( '/details/:transaction_id', ( request, response ) => {
  const { transaction_id } = request.params
  Promise.all([ Transaction.getById( transaction_id ) ])
  .then( r_transaction => response.render( 'transaction/details', { transaction: r_transaction[0] } ))
})

router.post( '/new', ( request, response ) => {
  const { order_id } = request.body
  Promise.all([ Transaction.new( order_id ) ])
  .then( r_transaction_id => {
    const transaction_id = r_transaction_id[0].id
    response.redirect( `/transaction/create/${transaction_id}` )
  })
})

router.get( '/create/:transaction_id', ( request, response ) => {
  const { transaction_id } = request.params
  response.redirect( `/transaction/details/${transaction_id}` )
})

router.get( '/pay/:transaction_id', ( request, response ) => {
  const { transaction_id } = request.params
  Promise.all([ Payment.getAll() ])
  .then( r_payments => response.render( 'transaction/pay_transaction', { payments: r_payments[0],
                                                                          transaction_id: transaction_id } ))

})

router.post( '/pay/:transaction_id', ( request, response ) => {
  const { transaction_id } = request.params
  const { payment_id } = request.body

  Promise.all([ Transaction.pay( transaction_id, payment_id ) ])
  .then( response.send( "Transaction Paid." ) )
})

module.exports = router
