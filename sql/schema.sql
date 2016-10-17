
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR( 150 ) NOT NULL,
  address VARCHAR( 150 ),
  phone VARCHAR( 13 ),
  username VARCHAR( 150 ) NOT NULL,
  password VARCHAR( 150 ) NOT NULL,
  payment_cards VARCHAR( 150 ),
  transaction_history VARCHAR( 300 )
);

DROP TABLE IF EXISTS payment_cards;

CREATE TABLE payment_cards
(
  id  SERIAL PRIMARY KEY,
  card_number VARCHAR( 50 ),
  csv VARCHAR( 3 ),
  expiration VARCHAR( 10 ),
  cardholder VARCHAR( 150 ),
  billing_address VARCHAR( 150 )
);

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions
(
  id  SERIAL PRIMARY KEY,
  customer_id VARCHAR( 10 ) NOT NULL,
  transaction_date VARCHAR( 10 ) NOT NULL,
  payment_method VARCHAR( 10 ) NOT NULL,
  price VARCHAR( 10 ) NOT NULL,
  delivery_location VARCHAR( 150 ),
  order_id VARCHAR( 10 ) NOT NULL
);

DROP TABLE IF EXISTS payment_types;

CREATE TABLE payment_types
(
  id SERIAL PRIMARY KEY,
  type VARCHAR( 80 ) NOT NULL
);

DROP TABLE IF EXISTS order_data;

CREATE TABLE order_data
(
  id SERIAL PRIMARY KEY,
  drinks VARCHAR( 80 ),
  custom_pizzas VARCHAR( 80 ),
  specialty_pizzas VARCHAR( 80 )
);

DROP TABLE IF EXISTS drinks;

CREATE TABLE drinks
(
  id SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  manufacturer VARCHAR( 150 ),
  supplier VARCHAR( 150 ),
  price VARCHAR( 10 ) NOT NULL
);

DROP TABLE IF EXISTS custom_pizzas;

CREATE TABLE custom_pizzas
(
  id  SERIAL PRIMARY KEY,
  crust VARCHAR( 80 ) NOT NULL,
  toppings VARCHAR( 80 ),
  price VARCHAR( 10 ) NOT NULL
);

DROP TABLE IF EXISTS specialty_pizzas;

CREATE TABLE specialty_pizzas
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  description TEXT,
  toppings VARCHAR( 80 ) NOT NULL,
  price VARCHAR( 10 ) NOT NULL
);

DROP TABLE IF EXISTS toppings;

CREATE TABLE toppings
(
  id  SERIAL PRIMARY KEY,
  name  VARCHAR( 80 ) NOT NULL,
  price VARCHAR( 10 ) NOT NULL
);

DROP TABLE IF EXISTS pizza_crusts;

CREATE TABLE pizza_crusts
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  price VARCHAR( 10 ) NOT NULL
);
