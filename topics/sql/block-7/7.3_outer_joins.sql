USE pizza_express_zli_example;

-- 1. Liste aller Produkte mit Produktkategorien
SELECT c.category, p.name, p.description, p.price
FROM category c
         LEFT JOIN product p ON c.id = p.fk_category_id
ORDER BY c.category, p.name;

-- 2. Liste aller Produktkategorien und Anzahl darin enthaltener Produkte.
SELECT c.category, COUNT(p.id) AS anzahl_produkte
FROM category c
         LEFT JOIN product p ON c.id = p.fk_category_id
GROUP BY c.category
ORDER BY c.category;