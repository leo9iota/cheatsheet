-- We are working in the pizza_express_zli_example database
USE pizza_express_zli_example;

-- 1) Berechnen Sie die Quadratwurzel aller Produktpreise
SELECT name,
       price,
       SQRT(price) AS sqrt_price
FROM product;

-- 2) Geben Sie den Namen des Monats aus dem Datum der Bestellungen aus
SELECT id,
       ordered_at,
       MONTHNAME(ordered_at) AS month_name
FROM order_entry;

-- 3) Zählen Sie die Anzahl Buchstaben in den Vornamen der Kunden
SELECT firstname,
       LENGTH(firstname) AS firstname_length
FROM customer;

-- 4) Listen Sie die Email-Adressen aller Kunden.
--    Teilen Sie die Adresse in zwei Spalten auf: Account und Domain
SELECT email,
       SUBSTRING_INDEX(email, '@', 1)  AS email_account,
       SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM customer;

-- 5) Geben Sie den Vornamen und Nachnamen der Kunden in einer Spalte aus,
--    z.B. "Hans Muster: HM" (Anfangsbuchstaben)
SELECT CONCAT(
               firstname, ' ', lastname, ': ',
               UPPER(LEFT(firstname, 1)),
               UPPER(LEFT(lastname, 1))
       ) AS name_with_initials
FROM customer;

-- 6) Berechnen Sie die 8% MwSt., die in den Preisen inbegriffen ist.
--    Option: Runden auf 5 Rappen (0.05)
--    Formel für den enthaltenen MwSt.-Betrag: price - (price / 1.08)
SELECT name,
       price,
       (price - (price / 1.08))                     AS vat_included,
       ROUND((price - (price / 1.08)) * 20, 0) / 20 AS vat_included_rounded_5rp
FROM product;

-- 7) Zeigen Sie den Mindest-, Höchst- und Durchschnittspreis aller Produkte
SELECT MIN(price) AS min_price,
       MAX(price) AS max_price,
       AVG(price) AS avg_price
FROM product;
