-- We are working in the pizza_express_zli_example database
USE pizza_express_zli_example;

-- 1) List all products
SELECT *
FROM product;

-- 2) List all categories
SELECT *
FROM category;

-- 3) List all customers, showing first name, last name, and email address
SELECT firstname, lastname, email
FROM customer;

-- 4) List all orders, sorted by order date
SELECT *
FROM order_entry
ORDER BY ordered_at;

-- 5) List all products, sorted in descending order by price
SELECT *
FROM product
ORDER BY price DESC;

-- 6) List the 3 most expensive products
SELECT *
FROM product
ORDER BY price DESC
LIMIT 3;

-- 7) List the 3 cheapest products
SELECT *
FROM product
ORDER BY price ASC
LIMIT 3;
