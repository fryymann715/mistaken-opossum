const db = require('./mainDB')

const Transaction = {

  getAll: () => db.any( `SELECT * FROM transaction` ),
  getById: transaction_id => db.one( `SELECT * FROM transaction WHERE id = ${transaction_id}` ),

  new: order_id => db.one( `INSERT INTO transaction ( order_id ) VALUES ( ${order_id} ) RETURNING id` )



}

module.exports = Transaction
