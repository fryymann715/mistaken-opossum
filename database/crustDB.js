const db = require('./mainDB')

const Crust = {

  add: ( name, price ) => db.none( `INSERT INTO crust ( name, price ) VALUES ( '${name}', '${price}' )` ),
  getAll: () => db.any( `SELECT * FROM crust` ),
  getById: crust_id => db.one( `SELECT * FROM crust WHERE id = ${crust_id}` ),
  update: ( id, name, price ) => {
    let sql = `UPDATE crust SET `
    if ( name != '' ) sql += `name='${name}'`
    if ( price != '' ) sql += `, price='${price}'`
    sql += ` WHERE id = '${id}'`
    db.none( sql ) },
  delete: id => db.none( `DELETE FROM crust WHERE id = '${id}'` )

}

module.exports = { Crust }
