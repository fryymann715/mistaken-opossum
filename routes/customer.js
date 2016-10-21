const express = require('express');
const router = express.Router();
const db = require('../database/mainDB')
const { customer } = require( '../database/customerDB' )


router.get( '/add', ( request, response ) => {
    response.render('customer/add')
})

router.post( '/add', ( request, response ) => {
  const { name, address, phone_number } = request.body

  Promise.all([ customer.add( name, address, phone_number ) ])
  .then( response.redirect('/customer/') )
})

router.get( '/', ( request, response ) => {
  Promise.all([ customer.getAll() ]).then( customer => {
    response.render('customer/index.pug', { customer: customer[0] })
  })
})

router.get( '/edit/:customer_id', ( request, response ) => {
  const { customer_id } = request.params

  Promise.all([ customer.getById( customer_id ) ]).then( data => {
    response.render( 'customer/edit', { customer: data[0]} )
  })
})

router.post( '/edit/:customer_id', ( request, response ) => {
  const { customer_id } = request.params
  const { name, address, phone_number} = request.body

  Promise.all([ customer.update( customer_id, name, address, phone_number) ])
  .then( response.redirect( '/customer/' ) )

})

router.get( '/delete/:customer_id', ( request, response ) => {
  const { customer_id } = request.params

  Promise.all([ customer.getById( customer_id ) ]).then( data => {
      response.render( 'customer/delete', { customer: data[0] } )
  })
})

router.post( '/delete/:customer_id', ( request, response ) => {
  const { customer_id } = request.params

  Promise.all([ customer.delete( customer_id ) ]).then( data => {
      response.redirect( '/customer/' )
  })
})

module.exports = router;