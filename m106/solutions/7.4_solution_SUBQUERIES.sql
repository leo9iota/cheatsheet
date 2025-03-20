USE pizza_express_solution;

-- 1. Produkte die mehr kosten als der Durchschnitt
SELECT p.name,
       p.price
FROM product p
WHERE p.price > (SELECT AVG(price) FROM product);

-- 2. Produkte die weniger kosten als der Durchschnitt
SELECT p.name,
       p.price
FROM product p
WHERE p.price < (SELECT AVG(price) FROM product);

-- 3. Bezeichnung und Preis des teuersten Produktes
SELECT p.name,
       p.price
FROM product p
WHERE p.price = (SELECT MAX(price) FROM product);

-- 4. Durchschnittliche Anzahl der Bestellungen pro Kunde
SELECT AVG(orders)
FROM (SELECT COUNT(o.id) AS orders
      FROM customer c
               LEFT JOIN order_entry o ON o.fk_customer_id = c.id
      GROUP BY c.id) AS temp;
