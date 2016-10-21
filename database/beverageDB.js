const db = require('./mainDB')



const Beverage = {
  add: ( name, manufacturer, supplier, price ) => db.one( `INSERT INTO beverage ( name, manufacturer, supplier, price ) VALUES ( '${name}', '${manufacturer}', '${supplier}', ${price} ) RETURNING id` ),
  getAll: () => db.any( `SELECT * FROM beverage` ),
  getById: id => db.one( `SELECT * FROM beverage WHERE id = ${id}` ),

  update: ( id, name, manufacturer, supplier, price ) => {
    let sql = `UPDATE beverage SET `

    let sep = `, `

    if( name != '') sql += `name='${name}'`
    if( manufacturer != '') sql += `manufacturer='${manufacturer}'`
    if( supplier != '') sql += `supplier='${supplier}'`
    if( price != '') sql += `price=${price}`
    sql += ` WHERE id = ${id}`
    db.none( sql ) },

  delete: id => db.none( `DELETE FROM beverage WHERE id = ${id}` )

}

module.exports = { Beverage }
