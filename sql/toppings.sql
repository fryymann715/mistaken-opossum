
DELETE FROM topping WHERE id = 1;
DELETE FROM topping WHERE id = 2;
DELETE FROM topping WHERE id = 3;
DELETE FROM topping WHERE id = 4;
DELETE FROM topping WHERE id = 5;
DELETE FROM topping WHERE id = 6;
DELETE FROM topping WHERE id = 7;
DELETE FROM topping WHERE id = 8;
DELETE FROM topping WHERE id = 9;

DELETE FROM crust WHERE id = 1;
DELETE FROM crust WHERE id = 2;
DELETE FROM crust WHERE id = 3;
DELETE FROM crust WHERE id = 4;

INSERT INTO topping (name, price) VALUES ('pepperoni', 1);
INSERT INTO topping (name, price) VALUES ('sausage', 1);
INSERT INTO topping (name, price) VALUES ('ham', 1);
INSERT INTO topping (name, price) VALUES ('bacon', 1);
INSERT INTO topping (name, price) VALUES ('chicken', 1);

INSERT INTO topping (name, price) VALUES ('mushroom', 1);
INSERT INTO topping (name, price) VALUES ('pineapple', 1);
INSERT INTO topping (name, price) VALUES ('green-pepper', 1);
INSERT INTO topping (name, price) VALUES ('jalapeno', 1);

INSERT INTO crust (name, price) VALUES ('small thin', 8);
INSERT INTO crust (name, price) VALUES ('medium thin', 10);
INSERT INTO crust (name, price) VALUES ('large thin', 14);
INSERT INTO crust (name, price) VALUES ('extra large thin', 18);
