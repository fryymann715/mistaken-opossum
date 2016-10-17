-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'pizza_crusts'
--
-- ---

DROP TABLE IF EXISTS `pizza_crusts`;

CREATE TABLE `pizza_crusts` (
  `id` INTEGER NOT NULL DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  `price` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'customers'
--
-- ---

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `address` VARCHAR NULL DEFAULT NULL,
  `phone` VARCHAR NULL DEFAULT NULL,
  `payment_cards` INTEGER NULL DEFAULT NULL,
  `pizza_preferences` MEDIUMTEXT NULL DEFAULT NULL,
  `transaction_history` INTEGER NULL DEFAULT NULL,
  `account_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ingredients'
--
-- ---

DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  `price` INTEGER NOT NULL DEFAULT 1.50,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'drinks'
--
-- ---

DROP TABLE IF EXISTS `drinks`;

CREATE TABLE `drinks` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  `manufacturer` VARCHAR NULL DEFAULT NULL,
  `supplier` INTEGER NULL DEFAULT NULL,
  `price` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'transactions'
--
-- ---

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `customer_id` INTEGER NOT NULL DEFAULT NULL,
  `date` DATETIME NOT NULL DEFAULT 'NULL',
  `payment_method` INTEGER NULL DEFAULT NULL,
  `price` INTEGER NOT NULL DEFAULT NULL,
  `delivery_location` VARCHAR NOT NULL DEFAULT 'NULL',
  `order_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'specialty_pizzas'
--
-- ---

DROP TABLE IF EXISTS `specialty_pizzas`;

CREATE TABLE `specialty_pizzas` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  `toppings` INTEGER NOT NULL DEFAULT NULL,
  `price` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'custom_pizzas'
--
-- ---

DROP TABLE IF EXISTS `custom_pizzas`;

CREATE TABLE `custom_pizzas` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `crust` INTEGER NOT NULL DEFAULT NULL,
  `toppings` INTEGER NULL DEFAULT NULL,
  `price` DOUBLE NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'order_data'
--
-- ---

DROP TABLE IF EXISTS `order_data`;

CREATE TABLE `order_data` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `drinks` INTEGER NULL DEFAULT NULL,
  `built_pizzas` INTEGER NULL DEFAULT NULL,
  `specialty_pizzas` INTEGER NULL DEFAULT NULL,
  `price` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'payment_types'
--
-- ---

DROP TABLE IF EXISTS `payment_types`;

CREATE TABLE `payment_types` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `type` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'payment_cards'
--
-- ---

DROP TABLE IF EXISTS `payment_cards`;

CREATE TABLE `payment_cards` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `card_type` INTEGER NOT NULL DEFAULT NULL,
  `number` VARCHAR NOT NULL DEFAULT 'NULL',
  `expiration` VARCHAR NOT NULL DEFAULT 'NULL',
  `csv` VARCHAR NOT NULL DEFAULT 'NULL',
  `owner_name` VARCHAR NULL DEFAULT NULL,
  `billing_address` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'users'
--
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `username` INTEGER NULL DEFAULT NULL,
  `password` INTEGER NULL DEFAULT NULL,
  `admin` BINARY NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `customers` ADD FOREIGN KEY (payment_cards) REFERENCES `payment_cards` (`id`);
ALTER TABLE `customers` ADD FOREIGN KEY (transaction_history) REFERENCES `transactions` (`id`);
ALTER TABLE `customers` ADD FOREIGN KEY (account_id) REFERENCES `users` (`id`);
ALTER TABLE `transactions` ADD FOREIGN KEY (customer_id) REFERENCES `customers` (`id`);
ALTER TABLE `transactions` ADD FOREIGN KEY (payment_method) REFERENCES `payment_types` (`id`);
ALTER TABLE `transactions` ADD FOREIGN KEY (delivery_location) REFERENCES `customers` (`address`);
ALTER TABLE `transactions` ADD FOREIGN KEY (order_id) REFERENCES `order_data` (`id`);
ALTER TABLE `specialty_pizzas` ADD FOREIGN KEY (toppings) REFERENCES `ingredients` (`id`);
ALTER TABLE `custom_pizzas` ADD FOREIGN KEY (crust) REFERENCES `pizza_crusts` (`id`);
ALTER TABLE `custom_pizzas` ADD FOREIGN KEY (toppings) REFERENCES `ingredients` (`id`);
ALTER TABLE `order_data` ADD FOREIGN KEY (drinks) REFERENCES `drinks` (`id`);
ALTER TABLE `order_data` ADD FOREIGN KEY (built_pizzas) REFERENCES `custom_pizzas` (`id`);
ALTER TABLE `order_data` ADD FOREIGN KEY (specialty_pizzas) REFERENCES `specialty_pizzas` (`id`);
ALTER TABLE `payment_cards` ADD FOREIGN KEY (card_type) REFERENCES `payment_types` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `pizza_crusts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `customers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ingredients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `drinks` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `transactions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `specialty_pizzas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `custom_pizzas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `order_data` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `payment_types` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `payment_cards` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `pizza_crusts` (`id`,`name`,`price`) VALUES
-- ('','','');
-- INSERT INTO `customers` (`id`,`name`,`address`,`phone`,`payment_cards`,`pizza_preferences`,`transaction_history`,`account_id`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `ingredients` (`id`,`name`,`price`) VALUES
-- ('','','');
-- INSERT INTO `drinks` (`id`,`name`,`manufacturer`,`supplier`,`price`) VALUES
-- ('','','','','');
-- INSERT INTO `transactions` (`id`,`customer_id`,`date`,`payment_method`,`price`,`delivery_location`,`order_id`) VALUES
-- ('','','','','','','');
-- INSERT INTO `specialty_pizzas` (`id`,`name`,`toppings`,`price`) VALUES
-- ('','','','');
-- INSERT INTO `custom_pizzas` (`id`,`crust`,`toppings`,`price`) VALUES
-- ('','','','');
-- INSERT INTO `order_data` (`id`,`drinks`,`built_pizzas`,`specialty_pizzas`,`price`) VALUES
-- ('','','','','');
-- INSERT INTO `payment_types` (`id`,`type`) VALUES
-- ('','');
-- INSERT INTO `payment_cards` (`id`,`card_type`,`number`,`expiration`,`csv`,`owner_name`,`billing_address`) VALUES
-- ('','','','','','','');
-- INSERT INTO `users` (`id`,`username`,`password`,`admin`) VALUES
-- ('','','','');
