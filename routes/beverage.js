const express = require('express');
const router = express.Router();
const { Beverage } = require('../database/beverageDB')

router.get('/', ( request, response ) => {
  Promise.all([ Beverage.getAll() ])
  .then( data => response.render('beverages/index', { beverages: data[0] }) )
})

router.get( '/details/:bev_id', ( request, response ) => {
  const { bev_id } = request.params
  Promise.all([ Beverage.getById( bev_id ) ])
  .then( data => {
    response.render( 'beverages/details', { beverage: data[0] } )
  })
})

router.get( '/add', ( request, response ) => {
  response.render( 'beverages/add' )
})

router.post( '/add', ( request, response ) => {
  const { name, manufacturer, supplier, price } = request.body
  Promise.all([ Beverage.add( name, manufacturer, supplier, price ) ])
  .then( data => {
    const bev_id = data[0].id
    response.redirect( `/beverage/details/${bev_id}` )
  })
})

router.get( '/delete/:id', ( request, response ) => {
  const { id } = request.params
  Promise.all([ Beverage.getById( id ) ])
  .then( data => {
    response.render( `beverages/delete`, { beverage: data[0] } )
  })

})

module.exports = router;
