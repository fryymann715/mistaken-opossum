const pgp = require('pg-promise')()
const DATABASE_NAME = 'mistaken-opossum'
const connectionString = `postgres://${process.env.USER}@localhost:5432/${DATABASE_NAME}`
const db = pgp(connectionString)

module.exports = db
