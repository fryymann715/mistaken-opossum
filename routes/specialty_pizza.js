const express = require('express');
const router = express.Router();
const db = require('../database/mainDB')
const { specialty_pizza } = require( '../database/specialty_pizzaDB' )

router.get( '/add', ( request, response ) => {
    response.render('specialty_pizza/addPizza')
})

router.post( '/add', ( request, response ) => {
  const { description, price } = request.body

  Promise.all([ specialty_pizza.add( description, price ) ])
  .then( response.redirect('/specialty_pizza/') )
})

router.get( '/', ( request, response ) => {
  Promise.all([ specialty_pizza.getAll() ]).then( specialty_pizza => {
    response.render('specialty_pizza/index.pug', { specialty_pizza: specialty_pizza[0] })
  })
})

router.get( '/edit/:specialty_pizza_id', ( request, response ) => {
  const { specialty_pizza_id } = request.params

  Promise.all([ specialty_pizza.getById( specialty_pizza_id ) ]).then( data => {
    response.render( 'specialty_pizza/edit_pizza', { specialty_pizza: data[0]} )
  })
})

router.post( '/edit/:specialty_pizza_id', ( request, response ) => {
  const { specialty_pizza_id } = request.params
  const { description, price} = request.body

  Promise.all([ specialty_pizza.update( specialty_pizza_id, description, price) ])
  .then( response.redirect( '/specialty_pizza/' ) )

})

router.get( '/delete/:specialty_pizza_id', ( request, response ) => {
  const { specialty_pizza_id } = request.params

  Promise.all([ specialty_pizza.getById( specialty_pizza_id ) ]).then( data => {
      response.render( 'specialty_pizza/delete_pizza', { specialty_pizza: data[0] } )
  })
})

router.post( '/delete/:specialty_pizza_id', ( request, response ) => {
  const { specialty_pizza_id } = request.params

  Promise.all([ specialty_pizza.delete( specialty_pizza_id ) ]).then( data => {
      response.redirect( '/specialty_pizza/' )
  })
})


module.exports = router;
