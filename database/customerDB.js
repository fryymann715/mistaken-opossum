const db = require( './mainDB' )


const Customer = {

  add: ( name, address, phone_number ) => db.none( `INSERT INTO customer ( name, address, phone_number ) VALUES ( '${name}', '${address}', '${phone_number}' )` ),
  getAll: () => db.any( `SELECT * FROM customer` ),
  getById: id => db.one( `SELECT * FROM customer WHERE id=${id}` ),
  getNames: () => db.any( `SELECT name FROM customer` ),
  update: ( id, name = '', address = '', phone_number = '' ) => {
          let sql = `BEGIN TRANSACTION;`
          if (name != '') sql += `UPDATE customer SET name='${name}' WHERE id = ${id};`
          if (address != '') sql += `UPDATE customer SET address='${address}' WHERE id = ${id};`
          if (phone_number != '') sql += `UPDATE customer SET phone_number='${phone_number}' WHERE id = ${id};`
          sql += `COMMIT;`
          db.none( sql )
        },
  delete: id => db.none( `DELETE FROM customer WHERE id=${id}` )



}

module.exports = { Customer }
