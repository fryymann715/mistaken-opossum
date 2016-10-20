const db = require('./mainDB')

const Beverage = {
  add: ( name, manufacturer, supplier, price ) => db.one( `INSERT INTO beverage ( name, manufacturer, supplier, price ) VALUES ( '${name}', '${manufacturer}', '${supplier}', ${price} ) RETURNING id` ),
  getAll: () => db.any( `SELECT * FROM beverage` ),
  getById: id => db.one( `SELECT * FROM beverage WHERE id = ${id}` )

}

module.exports = { Beverage }
