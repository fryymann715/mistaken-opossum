const db = require( './mainDB' )


const Customer = {

  add: ( name, address, phone_number ) => db.none( `INSERT INTO customer ( name, address, phone_number ) VALUES ( '${name}', '${address}', '${phone_number}' )` ),
  getAll: () => db.any( `SELECT * FROM customer` ),
  getById: id => db.one( `SELECT * FROM customer WHERE id=${id}` ),
  getNames: () => db.any( `SELECT name FROM customer` ),
  update: ( id, name = '', address = '', phone_number = '' ) => {
    let sql = `UPDATE customer SET `
    if (name != '') sql += `name='${name}'`
    if (address != '') sql += `, address='${address}'`
    if (phone_number != '') sql += `, phone_number='${phone_number}'`
    sql += ` WHERE id = ${id}`
    db.none( sql ) },
  delete: id => db.none( `DELETE FROM customer WHERE id=${id}` )



}

module.exports = { Customer }
