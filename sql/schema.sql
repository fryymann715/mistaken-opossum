

DROP TABLE IF EXISTS pizza_crusts CASCADE;

CREATE TABLE pizza_crusts
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  price INTEGER NOT NULL

);

DROP TABLE IF EXISTS toppings CASCADE;

CREATE TABLE toppings
(
  id  SERIAL PRIMARY KEY,
  name  VARCHAR( 80 ) NOT NULL,
  price INTEGER NOT NULL
);

DROP TABLE IF EXISTS payment_cards CASCADE;

CREATE TABLE payment_cards
(
  id  SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  card_type VARCHAR( 20 ) NOT NULL,
  card_number VARCHAR( 50 ) NOT NULL,
  csv VARCHAR( 3 ) NOT NULL,
  expiration VARCHAR( 10 ) NOT NULL,
  cardholder VARCHAR( 150 ) NOT NULL,
  billing_address VARCHAR( 150 ) NOT NULL
);


DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username VARCHAR( 80 ) NOT NULL,
  password VARCHAR( 80 ) NOT NULL,
  account_type VARCHAR( 10 ) NOT NULL DEFAULT 'user'
);

DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR( 150 ) NOT NULL,
  address VARCHAR( 150 ),
  phone VARCHAR( 13 ),
  account_id INTEGER,
  payment_cards VARCHAR(80),
  transaction_history VARCHAR(80)
);

DROP TABLE IF EXISTS drinks CASCADE;

CREATE TABLE drinks
(
  id SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  manufacturer VARCHAR( 150 ),
  supplier VARCHAR( 150 ),
  price INTEGER NOT NULL
);

DROP TABLE IF EXISTS custom_pizzas CASCADE;

CREATE TABLE custom_pizzas
(
  id  SERIAL PRIMARY KEY,
  crust INTEGER,
  toppings VARCHAR(80),
  price INTEGER NOT NULL
);

DROP TABLE IF EXISTS specialty_pizzas CASCADE;

CREATE TABLE specialty_pizzas
(
  id  SERIAL PRIMARY KEY,
  name VARCHAR( 80 ) NOT NULL,
  description TEXT,
  crust VARCHAR(80),
  toppings VARCHAR(80),
  price INTEGER NOT NULL
);

DROP TABLE IF EXISTS order_data CASCADE;

CREATE TABLE order_data
(
  id SERIAL PRIMARY KEY,
  drinks VARCHAR(80),
  custom_pizzas VARCHAR(80),
  specialty_pizzas VARCHAR(80),
  price INTEGER
);

DROP TABLE IF EXISTS transactions CASCADE;

CREATE TABLE transactions
(
  id  SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  transaction_date TIMESTAMP NOT NULL,
  payment_type INTEGER NOT NULL,
  delivery_location VARCHAR( 150 ),
  order_id INTEGER NOT NULL,
  price INTEGER NOT NULL
);



-- ---
-- Foreign Keys
-- ---

ALTER TABLE customers ADD FOREIGN KEY (account_id) REFERENCES users (id);

ALTER TABLE transactions ADD FOREIGN KEY (customer_id) REFERENCES customers (id);
ALTER TABLE transactions ADD FOREIGN KEY (payment_type) REFERENCES payment_cards (id);
ALTER TABLE transactions ADD FOREIGN KEY (order_id) REFERENCES order_data (id);

ALTER TABLE custom_pizzas ADD FOREIGN KEY (crust) REFERENCES pizza_crusts;


-------
-- Add CASH as payment_card entry 0.
-------
INSERT INTO customers (name) VALUES ('HOUSE');
INSERT INTO payment_cards (customer_id, card_type, card_number, csv, expiration, cardholder, billing_address) VALUES (1, 'CASH', 0,0, 'none', 'none', 'none');
