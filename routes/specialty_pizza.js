const express = require('express');
const router = express.Router();
const { specialty_pizza } = require('../database/specialty_pizzaDB')



router.post( '/details', ( request, response) => {
  const { pizza_id } = request.body
  Promise.all([ specialty_pizza.getById( pizza_id ) ])
  .then( data => {
    console.log (data)
    response.render( 'specialty_pizza/details', { specialty_pizza: data[0] } )
  })
})

router.get ('/add' , (request, response) => {
  Promise.all ([specialty_pizza.getAll() ] )
  .then( data => {
    response.render ( 'specialty_pizza/add', {specialty_pizza: data[0]} )
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
