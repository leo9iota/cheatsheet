USE pizza_express_solution;

-- Ändern Sie den Namen eines Kunden
UPDATE
    customer
SET lastname = 'Kuster'
WHERE id = 6;

-- Ändern Sie die Beschreibung und den Preis eines Produkts
UPDATE
    product
SET description = 'Olivenöl, Knoblauch',
    price       = 17.00
WHERE id = 22;

-- Erhöhen Sie den Preis aller Produkte um 10%
UPDATE
    product
SET price = price * 1.1;

-- Ändern Sie Kunde und Produkt einer Bestellung
UPDATE
    order_entry
SET fk_customer_id = 8
WHERE id = 25;

UPDATE
    product_order_entry
SET fk_product_id = 5
WHERE id = 97;

-- Alternative mit JOIN
UPDATE
    product p
        JOIN product_order_entry po ON po.fk_product_id = p.id
        JOIN order_entry o ON po.fk_order_entry_id = o.id
SET o.fk_customer_id = 8,
    po.fk_product_id = 5
WHERE o.id = 25
