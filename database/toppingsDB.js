const db = require( './mainDB' )


const Topping = {

  add: ( name, price ) => db.none( `INSERT INTO topping ( name, price ) VALUES ( '${name}', '${price}' )` ),
  delete: id => db.none( `DELETE FROM topping WHERE id=${id}` ),
  getAll: () => db.any( `SELECT * FROM topping` ),
  getById: id => db.one( `SELECT * FROM topping WHERE id=${id}` )

}

module.exports = { Topping }
