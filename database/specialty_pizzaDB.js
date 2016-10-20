const db = require('./mainDB')

const specialty_pizza = {

  add: ( description, price ) => db.none( `INSERT INTO specialty_pizza ( description, price ) VALUES ( '${description}', '${price}' )` ),
  getAll: () => db.any( `SELECT * FROM specialty_pizza` ),
  getById: specialty_pizza_id => db.one( `SELECT * FROM specialty_pizza WHERE id = ${specialty_pizza_id}` ),
  update: ( id, description, price ) => {
    let sql = `UPDATE specialty_pizza SET `
    if ( description != '' ) sql += `description='${description}'`
    if ( price != '' ) sql += `, price='${price}'`
    sql += ` WHERE id = '${id}'`
    db.none( sql ) },
  delete: id => db.none( `DELETE FROM specialty_pizza WHERE id = '${id}'` )

}

module.exports = { specialty_pizza }
