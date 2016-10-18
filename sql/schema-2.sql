DROP TABLE IF EXISTS topping CASCADE;

CREATE TABLE "topping" (
"id"  SERIAL NOT NULL ,
"name" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
"price" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS pizza_crusts CASCADE;

CREATE TABLE "pizza_crust" (
"id"  SERIAL NOT NULL ,
"name" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
"price" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS pizza_custom CASCADE;

CREATE TABLE "pizza_custom" (
"id"  SERIAL NOT NULL ,
"crust_type" INTEGER NOT NULL ,
"toppings" INTEGER ,
"price" INTEGER NOT NULL ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS pizza_specialty CASCADE;

CREATE TABLE "pizza_specialty" (
"id"  SERIAL NOT NULL ,
"crust_type" INTEGER NOT NULL ,
"toppings" INTEGER ,
"price" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS beverage CASCADE;

CREATE TABLE "beverage" (
"id"  SERIAL NOT NULL ,
"name" VARCHAR(80) ,
"manufacturer" VARCHAR(80) ,
"supplier" VARCHAR(80) ,
"price" INTEGER NOT NULL ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS order_data CASCADE;

CREATE TABLE "order_data" (
"id"  SERIAL NOT NULL ,
"beverages" INTEGER ,
"custom_pizzas" INTEGER ,
"specialty_pizzas" INTEGER ,
"price" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS transaction CASCADE;

CREATE TABLE "transaction" (
"id"  SERIAL NOT NULL ,
"customer_id" INTEGER ,
"date" TIMESTAMP ,
"delivery_address" VARCHAR(80) ,
"order_id" INTEGER ,
"price" INTEGER ,
"payment_used" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS payment_cards CASCADE;

CREATE TABLE "payment_cards" (
"id"  SERIAL NOT NULL ,
"card_type" INTEGER ,
"card_number" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
"expiration_date" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
"csv" INTEGER NOT NULL ,
"cardholder_name" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS payment_type CASCADE;

CREATE TABLE "payment_type" (
"id"  SERIAL NOT NULL ,
"name" VARCHAR(12) ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE "customer" (
"id"  SERIAL NOT NULL ,
"name" VARCHAR(80) ,
"account_id" INTEGER ,
"address" INTEGER ,
"phone_number" INTEGER ,
"cards_on_file" INTEGER ,
"transaction_history" INTEGER ,
PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS account CASCADE;

CREATE TABLE "account" (
"id"  SERIAL NOT NULL ,
"username" VARCHAR(80) NOT NULL DEFAULT 'NULL' ,
"password" VARCHAR(90) NOT NULL DEFAULT 'NULL' ,
PRIMARY KEY ("id")
);

ALTER TABLE "pizza_custom" ADD FOREIGN KEY ("crust_type") REFERENCES "pizza_crust" ("id");
ALTER TABLE "pizza_custom" ADD FOREIGN KEY ("toppings") REFERENCES "topping" ("id");
ALTER TABLE "pizza_specialty" ADD FOREIGN KEY ("crust_type") REFERENCES "pizza_crust" ("id");
ALTER TABLE "pizza_specialty" ADD FOREIGN KEY ("toppings") REFERENCES "topping" ("id");
ALTER TABLE "order_data" ADD FOREIGN KEY ("beverages") REFERENCES "beverage" ("id");
ALTER TABLE "order_data" ADD FOREIGN KEY ("custom_pizzas") REFERENCES "pizza_custom" ("id");
ALTER TABLE "order_data" ADD FOREIGN KEY ("specialty_pizzas") REFERENCES "pizza_specialty" ("id");
ALTER TABLE "transaction" ADD FOREIGN KEY ("order_id") REFERENCES "order_data" ("id");
ALTER TABLE "transaction" ADD FOREIGN KEY ("payment_used") REFERENCES "payment_cards" ("id");
ALTER TABLE "payment_cards" ADD FOREIGN KEY ("card_type") REFERENCES "payment_type" ("id");
ALTER TABLE "customer" ADD FOREIGN KEY ("account_id") REFERENCES "account" ("id");
ALTER TABLE "customer" ADD FOREIGN KEY ("cards_on_file") REFERENCES "payment_cards" ("id");
ALTER TABLE "customer" ADD FOREIGN KEY ("transaction_history") REFERENCES "transaction" ("id");
