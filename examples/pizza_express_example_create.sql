-- 1) CUSTOMER
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(100),
    phone       VARCHAR(20),
    address     VARCHAR(255),
    status      VARCHAR(20)
);

-- 2) PIZZA_COURIER
CREATE TABLE pizza_courier (
    pizza_courier_id INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(50),
    phone            VARCHAR(20),
    delivery_method  VARCHAR(50),
    status           VARCHAR(20)
);

-- 3) CUSTOMER_ORDER
CREATE TABLE customer_order (
    customer_order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id       INT, -- or fk_customer_id
    pizza_courier_id  INT, -- or fk_pizza_courier_id
    date_order        DATETIME,
    total_price       DECIMAL(10, 2),
    order_status      VARCHAR(20),
    payment_method    VARCHAR(20),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
            REFERENCES customer (customer_id),
    CONSTRAINT fk_order_courier
        FOREIGN KEY (pizza_courier_id)
            REFERENCES pizza_courier (pizza_courier_id)
);

-- 4) CATEGORY
CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50),
    description VARCHAR(255)
);

-- 5) PRODUCT
CREATE TABLE product (
    product_id     INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(50),
    price          DECIMAL(10, 2),
    stock_quantity INT,
    category_id    INT, -- or fk_category_id
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
            REFERENCES category (category_id)
);

-- 6) PRODUCT_CUSTOMER_ORDER
-- Many-to-many link between product and customer_order
-- You can give it a composite PK or separate ID.
-- Shown here with a composite PK on (product_id, customer_order_id).
CREATE TABLE product_customer_order (
    product_id        INT,
    customer_order_id INT,
    quantity          INT,
    price_at_order    DECIMAL(10, 2),
    PRIMARY KEY (product_id, customer_order_id),
    CONSTRAINT fk_pco_product
        FOREIGN KEY (product_id)
            REFERENCES product (product_id),
    CONSTRAINT fk_pco_order
        FOREIGN KEY (customer_order_id)
            REFERENCES customer_order (customer_order_id)
);
