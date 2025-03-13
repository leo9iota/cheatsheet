USE pizza_express_v1;

-- Insert categories
INSERT INTO category (name, description)
VALUES ('Pizza', 'Delicious handmade pizzas with fresh ingredients'),
       ('Drinks', 'Refreshing beverages to complement your meal'),
       ('Sides', 'Tasty sides to go with your pizza');

-- Insert products
INSERT INTO product (name, price, stock_quantity, fk_category_id)
VALUES ('Margherita Pizza', 9.99, 50, 1),
       ('Pepperoni Pizza', 12.99, 40, 1),
       ('BBQ Chicken Pizza', 14.99, 30, 1),
       ('Vegetarian Pizza', 11.99, 35, 1),
       ('Coca-Cola', 1.99, 100, 2),
       ('Pepsi', 1.99, 90, 2),
       ('Garlic Bread', 4.99, 60, 3),
       ('Chicken Wings', 6.99, 45, 3);

-- Insert customers
INSERT INTO customer (first_name, last_name, email, phone, address)
VALUES ('John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, Cityville'),
       ('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St, Townsville'),
       ('Mike', 'Johnson', 'mike.johnson@email.com', '555-123-4567', '789 Oak St, Villagetown'),
       ('Emily', 'Davis', 'emily.davis@email.com', '444-987-6543', '101 Pine St, Hamletville');

-- Insert pizza couriers
INSERT INTO pizza_courier (first_name, last_name, phone, delivery_method, status)
VALUES ('Alex', 'Mason', '111-222-3333', 'car', 'available'),
       ('Chris', 'Brown', '222-333-4444', 'bike', 'busy'),
       ('Taylor', 'Johnson', '333-444-5555', 'car', 'available');

-- Insert customer orders
INSERT INTO customer_order (fk_customer_id, fk_pizza_courier_id, total_price, order_status)
VALUES (1, 1, 25.97, 'delivered'),
       (2, 2, 19.98, 'pending'),
       (3, NULL, 15.99, 'pending'),
       (4, 3, 29.97, 'delivered');

-- Insert products into orders
INSERT INTO product_customer_order (fk_product_id, fk_customer_order_id, quantity, price_at_order)
VALUES (1, 1, 1, 9.99),
       (2, 1, 1, 12.99),
       (5, 1, 1, 2.99),
       (3, 2, 1, 14.99),
       (6, 2, 1, 1.99),
       (4, 3, 1, 11.99),
       (8, 3, 1, 3.99),
       (2, 4, 2, 12.99),
       (7, 4, 1, 4.99)