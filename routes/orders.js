const express = require('express');
const router = express.Router();
const { Order } = require('../database/orderDB')

router.get( '/', ( request, response ) => {
    Promise.all([ Order.getAll() ])
    .then( orderData => response.render( 'orders/index', { orders: orderData[0] } ) )
})

router.get( '/details/:order_id', ( request, response ) => {
  const { order_id } = request.params
  Promise.all([ Order.getCustomPizzas( order_id ), Order.getSpecialtyPizzas( order_id ), Order.getBeverages( order_id ) ])
  .then( data => {
    response.send( data )
  })

})

module.exports = router
