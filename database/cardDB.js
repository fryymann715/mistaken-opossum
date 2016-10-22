const db = require( './mainDB' )


const payment = {

  add: ( card_type, card_number, expiration_date, csv, cardholder_name ) => db.none( `INSERT INTO payment_cards ( card_type, card_number, expiration_date, csv, cardholder_name ) VALUES ( '${card_type}', '${card_number}', '${expiration_date}', '${csv}', '${cardholder_name}' )` ),
  getAll: () => db.any( `SELECT * FROM payment_cards` ),
  getById: id => db.one( `SELECT * FROM payment_cards WHERE id=${id}` ),
  update: ( id, card_type = '', card_number = '', expiration_date = '', csv = '', cardholder_name = '' ) => {
    let sql = `UPDATE payment_cards SET `
    if (card_type != '') sql += `card_type='${card_type}'`
    if (card_number != '') sql += `, card_number='${card_number}'`
    if (expiration_date != '') sql += `, expiration_date='${expiration_date}'`
    if (csv != '') sql += `, csv='${csv}'`
    if (cardholder_name != '') sql += `, cardholder_name='${cardholder_name}'`
    sql += ` WHERE id = ${id}`
    db.none( sql ) },
  delete: id => db.none( `DELETE FROM payment_cards WHERE id=${id}` )


}
//TODO: Add cheese and no cheese option
module.exports = { payment }
