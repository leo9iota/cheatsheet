USE pizza_express_zli_example;

-- 1. Adressliste aller Kunden mit Postleitzahl und Ort
SELECT c.firstname, c.lastname, c.address, z.zip, z.city
FROM customer c
         JOIN zip z
              ON c.fk_zip_id = z.id
ORDER BY c.lastname, c.firstname;

-- 2. Alle Produkte mit Beschreibung und Name der Kategorie
SELECT p.name, p.description, c.category
FROM product p
         JOIN category c
              ON p.fk_category_id = c.id
ORDER BY c.category, p.name;

-- 3. Alle Bestellungen mit Adresse, Postleitzahl, Bestell- und Lieferdatum
SELECT c.firstname,
       c.lastname,
       c.address,
       z.zip,
       z.city,
       oe.ordered_at   AS bestelldatum,
       oe.delivered_at AS lieferdatum
FROM order_entry oe
         JOIN customer c
              ON oe.fk_customer_id = c.id
         JOIN zip z
              ON c.fk_zip_id = z.id
ORDER BY oe.ordered_at DESC;

-- 4. Alle Bestellungen mit E-Mail des Kunden, Bestelldatum, Produktbezeichnung, Anzahl, Preis und Summe
SELECT c.email,
       oe.ordered_at            AS bestelldatum,
       p.name                   AS produktbezeichnung,
       poe.amount               AS anzahl,
       poe.price                AS einzelpreis,
       (poe.amount * poe.price) AS summe
FROM product_order_entry poe
         JOIN product p
              ON poe.fk_product_id = p.id
         JOIN order_entry oe
              ON poe.fk_order_entry_id = oe.id
         JOIN customer c
              ON oe.fk_customer_id = c.id
ORDER BY oe.ordered_at DESC, c.email;

-- 5. Kategorienamen mit Anzahl darin enthaltener Produkte
SELECT c.category, COUNT(p.id) AS anzahl_produkte
FROM category c
         LEFT JOIN product p ON c.id = p.fk_category_id
GROUP BY c.category
ORDER BY anzahl_produkte DESC;

-- 6. Kundennamen mit Anzahl Bestellungen
SELECT c.firstname, c.lastname, COUNT(oe.id) AS anzahl_bestellungen
FROM customer c
         LEFT JOIN order_entry oe ON c.id = oe.fk_customer_id
GROUP BY c.id, c.firstname, c.lastname
ORDER BY anzahl_bestellungen DESC;

-- 7. Erhöhung aller Preise in der Kategorie 'Pizza' um 10%
UPDATE product p
    JOIN category c ON p.fk_category_id = c.id
SET p.price = p.price * 1.1
WHERE c.category = 'Pizza';

-- 8. Löschen aller Bestellungen von Kunden mit PLZ 8051
DELETE oe
FROM order_entry oe
         JOIN customer c ON oe.fk_customer_id = c.id
         JOIN zip z ON c.fk_zip_id = z.id
WHERE z.zip = 8051;