DROP DATABASE IF EXISTS pizza_express_v2;
CREATE DATABASE pizza_express_v2;
USE pizza_express_v2;

CREATE TABLE zip (
    zip_id INT UNSIGNED         NOT NULL AUTO_INCREMENT,
    zip    SMALLINT(4) UNSIGNED NOT NULL,
    city   VARCHAR(255)         NOT NULL,

    PRIMARY KEY (zip_id),
    UNIQUE (zip, city)
);

CREATE TABLE customer (
    customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fk_zip_id   INT UNSIGNED NOT NULL,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    address     VARCHAR(255) NOT NULL,
    email       VARCHAR(384) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    phone       VARCHAR(255),

    PRIMARY KEY (customer_id),
    FOREIGN KEY (fk_zip_id) REFERENCES zip (zip_id) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (email)
);

CREATE TABLE category (
    category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category    VARCHAR(255) NOT NULL,

    PRIMARY KEY (category_id),
    UNIQUE (category)
);

CREATE TABLE product (
    product_id     INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    fk_category_id INT UNSIGNED  NOT NULL,
    name           VARCHAR(255)  NOT NULL,
    description    VARCHAR(255)  NOT NULL,
    price          DECIMAL(6, 2) NOT NULL,

    PRIMARY KEY (product_id),
    FOREIGN KEY (fk_category_id) REFERENCES category (category_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE order_entry (
    order_entry_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fk_customer_id INT UNSIGNED NOT NULL,
    ordered_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    delivered_at   DATETIME     NULL,

    PRIMARY KEY (order_entry_id),
    FOREIGN KEY (fk_customer_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE product_order_entry (
    product_order_entry_id INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    fk_product_id          INT UNSIGNED  NOT NULL,
    fk_order_entry_id      INT UNSIGNED  NOT NULL,
    amount                 INT UNSIGNED  NOT NULL DEFAULT 1,
    price                  DECIMAL(6, 2) NULL,

    PRIMARY KEY (product_order_entry_id),
    FOREIGN KEY (fk_product_id) REFERENCES product (product_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (fk_order_entry_id) REFERENCES order_entry (order_entry_id) ON UPDATE CASCADE ON DELETE CASCADE
);
