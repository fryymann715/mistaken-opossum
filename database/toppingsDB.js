const db = require( './mainDB' )


const Topping = {

  add: ( name, price ) => db.none( `INSERT INTO topping ( name, price ) VALUES ( '${name}', '${price}' )` ),
  getAll: () => db.any( `SELECT * FROM topping` ),
  getById: id => db.one( `SELECT * FROM topping WHERE id=${id}` ),
  getNames: () => db.any( `SELECT name FROM topping` ),
  update: ( id, name = '', price = '' ) => {
    let sql = `UPDATE topping SET `
    if (name != '') sql += `name='${name}'`
    if (price != '') sql += `, price='${price}'`
    sql += ` WHERE id = ${id}`
    db.none( sql ) },
  delete: id => db.none( `DELETE FROM topping WHERE id=${id}` )


}
//TODO: Add cheese and no cheese option
module.exports = { Topping }
