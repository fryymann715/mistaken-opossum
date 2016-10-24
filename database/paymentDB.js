const db = require( './mainDB' )


const Payment = {

  add: ( card_type, card_number, expiration_date, csv, cardholder_name ) => db.one( `INSERT INTO payment_cards ( card_type, card_number, expiration_date, csv, cardholder_name ) VALUES ( '${card_type}', '${card_number}', '${expiration_date}', '${csv}', '${cardholder_name}' ) RETURNING id` ),
  getAll: () => db.any( `SELECT * FROM payment_cards` ),
  getById: id => db.one( `SELECT * FROM payment_cards WHERE id=${id}` ),
  joinCard: (customer_id, payment_id) => db.none(`INSERT INTO cards_on_file (customer_id, card_id) VALUES( ${customer_id}, ${payment_id})`),
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

module.exports = { Payment }
