USE pizza_express_v2;

-- 1. Add a column for mobile phone numbers in the customer table
ALTER TABLE customer
    ADD COLUMN mobile VARCHAR(255);

-- 2. Rename the column for product names
ALTER TABLE product
    CHANGE COLUMN name product_name VARCHAR(255) NOT NULL;

-- 3. Change the data type of the product price to DECIMAL(6,2) UNSIGNED
ALTER TABLE product
    MODIFY COLUMN price DECIMAL(6, 2) UNSIGNED;

-- 4. Set NOT NULL for the product price
ALTER TABLE product
    MODIFY COLUMN price DECIMAL(6, 2) UNSIGNED NOT NULL;

-- 5. Add a new attribute `created_at` in the product table with automatic timestamps
ALTER TABLE product
    ADD COLUMN created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- 6. Remove the mobile phone column from the customer table
ALTER TABLE customer
    DROP COLUMN mobile;

-- 7. Drop the foreign key constraint for zip codes in the customer table
SHOW CREATE TABLE customer; -- Find the actual FK constraint name first
ALTER TABLE customer
    DROP FOREIGN KEY customer_ibfk_1;
-- Replace with the actual constraint name

-- 8. Re-add the foreign key constraint
ALTER TABLE customer
    ADD CONSTRAINT fk_customer_zip FOREIGN KEY (fk_zip_id) REFERENCES zip (id) ON DELETE CASCADE;
