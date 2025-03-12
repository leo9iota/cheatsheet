DROP DATABASE IF EXISTS pizza_express;
CREATE DATABASE pizza_express;
USE pizza_express;

CREATE TABLE category
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    description TEXT

);

CREATE TABLE product
(
    product_id     INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(100)   NOT NULL,
    price          DECIMAL(10, 2) NOT NULL,
    stock_quantity INT            NOT NULL DEFAULT 0,
    fk_category_id INT            NOT NULL,

    FOREIGN KEY (fk_category_id) REFERENCES category (category_id) ON DELETE CASCADE
);

CREATE TABLE customer
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(20),
    address     TEXT
);

CREATE TABLE pizza_courier
(
    pizza_courier_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name       VARCHAR(50)                            NOT NULL,
    last_name        VARCHAR(50)                            NOT NULL,
    phone            VARCHAR(20)                            NOT NULL UNIQUE,
    delivery_method  ENUM ('car', 'bike')                   NOT NULL DEFAULT 'car',
    status           ENUM ('available', 'busy', 'off-duty') NOT NULL DEFAULT 'available'
);

CREATE TABLE customer_order
(
    customer_order_id   INT AUTO_INCREMENT PRIMARY KEY,
    fk_customer_id      INT                           NOT NULL,
    fk_pizza_courier_id INT                           NULL,
    order_date          DATETIME                               DEFAULT CURRENT_TIMESTAMP,
    total_price         DECIMAL(10, 2)                NOT NULL DEFAULT 0.00,
    order_status        ENUM ('pending', 'delivered') NOT NULL DEFAULT 'pending',

    FOREIGN KEY (fk_customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_pizza_courier_id) REFERENCES pizza_courier (pizza_courier_id) ON DELETE SET NULL
);

CREATE TABLE product_customer_order
(
    fk_product_id        INT            NOT NULL,
    fk_customer_order_id INT            NOT NULL,
    quantity             INT            NOT NULL DEFAULT 1,
    price_at_order       DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (fk_product_id, fk_customer_order_id),
    FOREIGN KEY (fk_product_id) REFERENCES product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (fk_customer_order_id) REFERENCES customer_order (customer_order_id) ON DELETE CASCADE
);