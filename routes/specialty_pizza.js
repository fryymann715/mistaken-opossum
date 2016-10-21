const express = require('express');
const router = express.Router();
const { specialty_pizza } = require('../database/specialty_pizzaDB')



router.post( '/details', ( request, response) => {
  const { order_id, pizza_id } = request.body
  Promise.all([ specialty_pizza.getById( pizza_id ) ])
  .then( data => {
    response.render( 'specialty_pizza/details', { specialty_pizza: data[0],
                                                  order_id: order_id } )
  })
})

router.get ('/add/:order_id' , (request, response) => {
  const { order_id } = request.params
  Promise.all ([specialty_pizza.getAll() ] )
  .then( data => {
    response.render ( 'specialty_pizza/add', {specialty_pizza: data[0],
                                              order_id: order_id } )
  })
})

router.post ('/add' , (request, response) => {
  const { pizza_id } = request.body

  Promise.all ([specialty_pizza.getAll() ] )
  .then( data => {
    response.render ( 'specialty_pizza/add', {specialty_pizza: data[0]} )
  })
})

module.exports = router;
