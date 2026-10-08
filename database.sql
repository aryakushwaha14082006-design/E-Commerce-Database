CREATE DATABASE ecommerce_db;
USE ecommerce_db;
SHOW DATABASES;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50)
);

DESC customers;
SHOW TABLES;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category VARCHAR(50)
);

DESC products;
SHOW TABLES;
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);
DESC categories;
SHOW TABLES;
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
DESC orders;
SHOW TABLES;
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
DESC order_details;
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
SHOW TABLES;
INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Sports');

SELECT * FROM categories;
INSERT INTO products (product_name, price, stock, category)
VALUES
('Wireless Mouse', 599.00, 25, 'Electronics'),
('Mechanical Keyboard', 1499.00, 15, 'Electronics'),
('USB-C Cable', 299.00, 40, 'Electronics'),
('T-Shirt', 799.00, 30, 'Clothing'),
('Jeans', 1299.00, 20, 'Clothing'),
('C Programming Book', 499.00, 12, 'Books'),
('Table Lamp', 899.00, 18, 'Home Appliances'),
('Cricket Bat', 2499.00, 8, 'Sports');
SELECT * FROM products;
INSERT INTO customers (name, email, phone, city)
VALUES
('Aman Sharma', 'aman@gmail.com', '9876543210', 'Bhopal'),
('Priya Verma', 'priya@gmail.com', '9123456780', 'Indore'),
('Rahul Singh', 'rahul@gmail.com', '9988776655', 'Jabalpur'),
('Neha Patel', 'neha@gmail.com', '9876501234', 'Gwalior'),
('Rohit Gupta', 'rohit@gmail.com', '9090909090', 'Satna');
SELECT * FROM customers;

INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2026-10-01', 2098.00, 'Completed'),
(2, '2026-10-02', 1299.00, 'Completed'),
(3, '2026-10-03', 2499.00, 'Pending'),
(4, '2026-10-04', 1499.00, 'Completed'),
(5, '2026-10-05', 1798.00, 'Shipped');

SELECT * FROM orders;

INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
(1, 1, 2, 599.00),
(1, 3, 3, 299.00),
(2, 5, 1, 1299.00),
(3, 8, 1, 2499.00),
(4, 2, 1, 1499.00),
(5, 7, 2, 899.00);

SELECT * FROM order_details;
INSERT INTO payments (order_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, '2026-10-01', 'UPI', 2098.00, 'Paid'),
(2, '2026-10-02', 'Card', 1299.00, 'Paid'),
(3, '2026-10-03', 'Cash', 2499.00, 'Pending'),
(4, '2026-10-04', 'UPI', 1499.00, 'Paid'),
(5, '2026-10-05', 'Card', 1798.00, 'Paid');
SELECT * FROM payments;