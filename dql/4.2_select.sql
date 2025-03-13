-- Use the pizza_express_zli_example database
USE pizza_express_zli_example;

-- 1) Calculate the square root of all product prices
SELECT name,
       price,
       SQRT(price) AS sqrt_price
FROM product;

-- 2) Show the month name from the order date
SELECT id,
       ordered_at,
       MONTHNAME(ordered_at) AS month_name
FROM order_entry;

-- 3) Count the number of letters in the customers' first names
SELECT firstname,
       LENGTH(firstname) AS firstname_length
FROM customer;

-- 4) List all customers' email addresses.
--    Split each address into two columns: account and domain
-- 4) List all customers' email addresses.
SELECT email,
       SUBSTRING_INDEX(email, '@', 1)  AS email_account,
       SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM customer;

-- 5) Display the first and last name of the customers in one column, e.g. "Hans Muster: HM"
SELECT CONCAT(
               firstname, ' ', lastname, ': ',
               UPPER(LEFT(firstname, 1)),
               UPPER(LEFT(lastname, 1))
       ) AS name_with_initials
FROM customer;

-- 6) Calculate the 8% VAT that is included in the product prices.
--    Optionally, round to the nearest 0.05
--    The formula for the included VAT amount is: price - (price / 1.08)
-- 6) Calculate the 8% VAT that is included in the product prices.
SELECT name,
       price,
       (price - (price / 1.08))                     AS vat_included,
       ROUND((price - (price / 1.08)) * 20, 0) / 20 AS vat_included_rounded_5rp
FROM product;

-- 7) Show the minimum, maximum, and average price of all products
SELECT MIN(price) AS min_price,
       MAX(price) AS max_price,
       AVG(price) AS avg_price
FROM product;
