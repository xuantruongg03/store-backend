CREATE DATABASE computer_store;

USE computer_store;

CREATE TABLE products (
    product_id VARCHAR(10) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT,
    product_price DECIMAL(10, 2) NOT NULL,
    product_sale_price DECIMAL(10, 2) DEFAULT 0,
    product_type VARCHAR(255) NOT NULL,
    product_quantity INT,
    PRIMARY KEY (product_id)
);

CREATE TABLE product_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL,
    detail_name VARCHAR(255) NOT NULL,
    detail_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE customers (
    customer_id VARCHAR(10) NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(400) DEFAULT NULL,
    code VARCHAR(45) DEFAULT NULL,
    refresh_token VARCHAR(255) DEFAULT NULL
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    order_date VARCHAR(255) NOT NULL,
    order_quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    number_phone VARCHAR(255) NOT NULL,
    notes VARCHAR(255) DEFAULT NULL,
    payment VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE banners (
    banner_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    banner_name VARCHAR(255) NOT NULL,
    banner_image VARCHAR(255) NOT NULL,
    banner_type VARCHAR(255) NOT NULL DEFAULT 'width'
);

CREATE TABLE repair_schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    address VARCHAR(255) NOT NULL,
    number_phone VARCHAR(255) NOT NULL,
    repair_date VARCHAR(255) NOT NULL,
    problem VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE blogs (
    blog_id VARCHAR(50) PRIMARY key,
    blog_title VARCHAR (255),
    blog_description TEXT,
    blog_content TEXT,
    customer_id VARCHAR(10),
    blog_image VARCHAR(255),
    blog_rate int DEFAULT 0,
    blog_visited int DEFAULT 0,
    blog_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    blog_status bit DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE comments_blog (
    comment_blog_id INT AUTO_INCREMENT PRIMARY KEY,
    blog_id VARCHAR (50),
    comment_blog_name_user VARCHAR(255),
    comment_blog_value TEXT,
    comment_blog_created_at VARCHAR(255),
    FOREIGN KEY (blog_id) REFERENCES blogs (blog_id)
);

CREATE TABLE whitelist (
    id_whitelist INT AUTO_INCREMENT PRIMARY KEY,
    ip_whitelist VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO
    whitelist (ip_whitelist)
VALUES
    ('192.168.1.124')