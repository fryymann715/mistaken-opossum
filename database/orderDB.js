const db = require('./mainDB')

const Order = {

  new: () => db.one( `INSERT INTO order_data ( price ) VALUES ( 0 )` ),
  getAll: () => db.any( `SELECT * FROM order_data` ),
  getById: id => db.one( `SELECT * FROM order_data WHERE id = ${id}` ),

  getCustomPizzas: order_id => db.any( `SELECT pizza_id AS custom FROM ordered_custom_pizzas WHERE order_id=${order_id}` ),

  getSpecialtyPizzas: order_id => db.any( `SELECT pizza_id AS specialty FROM ordered_specialty_pizzas WHERE order_id=${order_id}` ),
  getBeverages: order_id => db.any( `SELECT beverage_id as beverage FROM ordered_beverages WHERE order_id=${order_id}` ),
                                // const results = {}
                                // results['customPizzas'] = db.any( `SELECT pizza_id FROM ordered_custom_pizzas WHERE order_id=${order_id}` )
                                // //results['specialtyPizzas'] = db.any( `SELECT pizza_id FROM ordered_specialty_pizzas WHERE order_id=${order_id}` )
                                // //results['beverages'] = db.any( `SELECT beverage_id FROM ordered_beverages WHERE order_id=${order_id}` )
                                // console.log(results)
                                // return results

  addCustomPizza: ( order_id, pizza_id ) => db.none( `INSERT INTO ordered_custom_pizzas ( order_id, pizza_id ) VALUES ( ${order_id}, ${pizza_id} )` ),
  addSpecialtyPizza: ( order_id, pizza_id ) => db.none( `INSERT INTO ordered_specialty_pizzas ( order_id, pizza_id ) VALUES ( ${order_id}, ${pizza_id} )` ),
  addBeverage: ( order_id, beverage_id ) => db.none( `INSERT INTO ordered_beverages ( order_id, beverage_id ) VALUES ( ${order_id}, ${beverage_id} )` ),

  removeCustomPizza: ( order_id, pizza_id ) => db.none( `DELETE FROM ordered_custom_pizzas WHERE order_id=${order_id} AND pizza_id=${pizza_id}` ),
  removeSpecialtyPizza: ( order_id, pizza_id ) => db.none( `DELETE FROM ordered_specialty_pizzas WHERE order_id=${order_id} AND pizza_id=${pizza_id}` ),
  removeBeverage: ( order_id, beverage_id ) => db.none( `DELETE FROM ordered_beverages WHERE order_id=${order_id} AND beverage_id=${beverage_id}` ),

  delete: order_id => {
                        db.none( `DELETE FROM ordered_custom_pizzas WHERE order_id = ${order_id}` )
                        db.none( `DELETE FROM ordered_specialty_pizzas WHERE order_id = ${order_id}` )
                        db.none( `DELETE FROM ordered_beverages WHERE order_id = ${order_id}` )
                        db.none( `DELETE FROM order_data WHERE order_id = ${order_id}` )
                      }

}

module.exports = { Order }
