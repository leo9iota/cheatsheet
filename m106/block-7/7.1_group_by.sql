USE pizza_express_zli_example;

-- 1. Average price of all products
SELECT AVG(price) AS average_price
FROM product;

-- 2. Product count per category
SELECT c.category, COUNT(p.id) AS product_count
FROM category c
         LEFT JOIN product p
                   ON c.id = p.fk_category_id
GROUP BY c.id, c.category;

-- 3. Customer count per ZIP
SELECT z.id        AS zip_id,
       z.zip,
       z.city,
       COUNT(c.id) AS anzahl_kunden
FROM customer c
         JOIN zip z
              ON c.fk_zip_id = z.id
GROUP BY z.id;

-- 4. Max, min, and avg price per product category

SELECT c.category   AS kategorie,
       MIN(p.price) AS min_preis,
       MAX(p.price) AS max_preis,
       AVG(p.price) AS avg_preis
FROM product p
         JOIN category c
              ON p.fk_category_id = c.id
GROUP BY c.id;

-- 5. Average price of the product category with foreign key 2
SELECT c.category   AS kategorie,
       AVG(p.price) AS durchschnittspreis
FROM product p
         JOIN category c
              ON p.fk_category_id = c.id
GROUP BY c.id
HAVING AVG(p.price) > (SELECT AVG(price) FROM product);

-- 6. Product categories with an average price greater than the result of task 1
SELECT c.category, AVG(p.price) AS avg_price
FROM category c
         JOIN product p
              ON c.id = p.fk_category_id
GROUP BY c.id, c.category
HAVING AVG(p.price) > (SELECT AVG(price) FROM product);
