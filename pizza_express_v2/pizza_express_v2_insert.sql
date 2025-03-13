USE pizza_express_v2;

-- Ensure transactions are explicitly managed
SET AUTOCOMMIT = 0;

-- Start transaction
START TRANSACTION;

-- Insert zip codes
INSERT INTO zip (zip, city)
VALUES
    (8001, 'Zürich'),
    (8002, 'Zürich'),
    (8048, 'Zürich'),
    (8008, 'Zürich'),
    (8049, 'Zürich'),
    (8051, 'Zürich'),
    (8902, 'Urdorf'),
    (8952, 'Schlieren'),
    (8600, 'Dübendorf'),
    (8402, 'Winterthur');

-- Insert customers
INSERT INTO customer (fk_zip_id, first_name, last_name, address, email, password, phone)
VALUES
    (2, 'Hans', 'Muster', 'Nordstrasse 1', 'hans@muster.com', SHA2('insecure', 256), '044 123 45 67'),
    (5, 'Barbara', 'Meier', 'Baslerstrasse 20', 'b.meier@gmail.com', SHA2('1234', 256), '044 101 45 80'),
    (6, 'Fritz', 'Müller', 'Bernerstrasse 209', 'fritz@mueller.com', SHA2('spiderman', 256), NULL),
    (3, 'Freddy', 'Brunner', 'Blumenweg 10', 'fred@outlook.com', SHA2('porsche', 256), '044 330 23 09'),
    (4, 'Peter', 'Keller', 'Seestrasse 171', 'peter.keller@outlook.com', SHA2('letmein', 256), NULL),
    (7, 'Bruno', 'Kuster', 'Dorfstrasse 21', 'bk@hotmail.com', SHA2('kakadu', 256), '044 880 13 50');

-- Insert product categories
INSERT INTO category (category)
VALUES ('Pizza'), ('Salate'), ('Getränke'), ('Pasta'), ('Dessert');

-- Insert products
INSERT INTO product (fk_category_id, product_name, description, price)
VALUES
    (1, 'Margherita', 'Tomaten, Mozzarella', 17.00),
    (1, 'Prosciutto', 'Tomaten, Schinken, Mozzarella', 18.00),
    (1, 'Siziliana', 'Tomaten, Salami, Mozzarella', 19.00),
    (1, 'Quattro Stagioni', 'Tomaten, Schinken, Peperoni, Artischocken, Mozzarella', 17.00),
    (1, 'Padrone', 'Tomaten, Kalbfleisch, Mozzarella', 17.00),
    (2, 'Kleiner grüner Salat', 'Grüner Blattsalat', 6.00),
    (3, 'Coca-Cola', '5dl', 4.50),
    (3, 'Fanta', '5dl', 4.50),
    (3, 'Valser', '5dl', 4.50),
    (3, 'Red Bull', '33cl', 5.50);

-- Insert orders
INSERT INTO order_entry (fk_customer_id, ordered_at, delivered_at)
VALUES
    (2, CURRENT_TIMESTAMP - INTERVAL 5 DAY, CURRENT_TIMESTAMP - INTERVAL 3 DAY),
    (1, CURRENT_TIMESTAMP - INTERVAL 5 DAY, NULL),
    (4, CURRENT_TIMESTAMP - INTERVAL 5 DAY, CURRENT_TIMESTAMP - INTERVAL 1 DAY),
    (2, CURRENT_TIMESTAMP - INTERVAL 5 DAY, NULL);

-- Insert product orders
INSERT INTO product_order_entry (fk_product_id, fk_order_entry_id, amount)
VALUES
    (3, 1, 1),
    (4, 1, 2),
    (5, 1, 3),
    (1, 2, 1);

-- Update the product_order_entry with current product prices
UPDATE product_order_entry pb
INNER JOIN product p ON p.id = pb.fk_product_id
SET pb.price = p.price;

-- Commit transaction
COMMIT;

-- Enable autocommit again
SET AUTOCOMMIT = 1;
