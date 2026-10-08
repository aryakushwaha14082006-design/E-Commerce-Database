USE ecommerce_db;
SELECT * FROM customers;
SELECT product_name, price
FROM products
WHERE price > 1000;
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT SUM(amount) AS total_sales
FROM payments
WHERE payment_status = 'Paid';
SELECT payment_method, SUM(amount) AS total_amount
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method;

SELECT ok hogya

    customers.name,
    orders.order_id,
    orders.total_amount,
    orders.status
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT
    customers.name AS customer_name,
    orders.order_id,
    products.product_name,
    order_details.quantity,
    order_details.price
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_details
    ON orders.order_id = order_details.order_id
JOIN products
    ON order_details.product_id = products.product_id;
    
    SELECT
    products.product_name,
    SUM(order_details.quantity) AS total_sold
FROM products
JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_sold DESC
LIMIT 1;

SELECT
    customers.name AS customer_name,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC;

SELECT
    customers.name AS customer_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
ORDER BY total_orders DESC;

SELECT
    AVG(total_amount) AS average_order_value
FROM orders;

SELECT
    SUM(total_amount) AS completed_sales
FROM orders
WHERE status = 'Completed';

SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status;

SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

SELECT
    product_name,
    price,
    category
FROM products
WHERE price > 1000
ORDER BY price DESC;

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

SELECT
    product_name,
    stock,
    category
FROM products
WHERE stock < 15
ORDER BY stock ASC;

SELECT
    customers.name AS customer_name,
    orders.order_id,
    orders.total_amount,
    orders.status AS order_status,
    payments.payment_method,
    payments.payment_status
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN payments
    ON orders.order_id = payments.order_id;
    
    SELECT
    payment_method,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT
    orders.order_id,
    customers.name AS customer_name,
    payments.amount,
    payments.payment_method,
    payments.payment_status
FROM payments
JOIN orders
    ON payments.order_id = orders.order_id
JOIN customers
    ON orders.customer_id = customers.customer_id
WHERE payments.payment_status = 'Pending';

SELECT
    customers.name AS customer_name,
    products.product_name,
    order_details.quantity,
    order_details.price
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_details
    ON orders.order_id = order_details.order_id
JOIN products
    ON order_details.product_id = products.product_id
ORDER BY customers.name;

SELECT
    category,
    SUM(price * stock) AS inventory_value
FROM products
GROUP BY category
ORDER BY inventory_value DESC;

SELECT
    order_id,
    customer_id,
    total_amount,
    status
FROM orders
ORDER BY total_amount DESC
LIMIT 1;

SELECT
    customers.name AS customer_name,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC;

SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

SELECT
    products.product_id,
    products.product_name,
    products.price,
    products.stock
FROM products
LEFT JOIN order_details
    ON products.product_id = order_details.product_id
WHERE order_details.product_id IS NULL;

SELECT
    customers.customer_id,
    customers.name,
    customers.city
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;

SELECT
    products.category,
    SUM(order_details.quantity * order_details.price) AS total_sales
FROM products
JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.category
ORDER BY total_sales DESC;

SELECT
    products.product_name,
    SUM(order_details.quantity) AS total_sold
FROM products
JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_sold DESC
LIMIT 3;

SELECT
    customers.name AS customer_name,
    SUM(orders.total_amount) AS completed_spending
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Completed'
GROUP BY customers.customer_id, customers.name
ORDER BY completed_spending DESC;

SELECT
    MONTH(order_date) AS month,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

SELECT
    customers.name AS customer_name,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
HAVING SUM(orders.total_amount) > (
    SELECT AVG(total_amount)
    FROM orders
)
ORDER BY total_spent DESC;

SELECT
    customers.name AS customer_name,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC
LIMIT 1;

SELECT
    products.product_name,
    SUM(order_details.quantity * order_details.price) AS revenue
FROM products
JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name
ORDER BY revenue DESC;

SELECT
    customers.name AS customer_name,
    MAX(orders.order_date) AS last_order_date
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
ORDER BY last_order_date DESC;

SELECT
    customers.name AS customer_name,
    orders.order_id,
    orders.total_amount,
    orders.status
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.status <> 'Completed'
ORDER BY orders.total_amount DESC;

SELECT
    product_name,
    price,
    stock,
    (price * stock) AS stock_value
FROM products
ORDER BY stock_value DESC;

SELECT
    customers.name AS customer_name,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name
HAVING SUM(orders.total_amount) > 2000
ORDER BY total_spent DESC;

CREATE VIEW customer_order_summary AS
SELECT
    customers.name AS customer_name,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.name;

SELECT * FROM customer_order_summary;

CREATE VIEW product_sales_summary AS
SELECT
    products.product_name,
    SUM(order_details.quantity) AS total_sold,
    SUM(order_details.quantity * order_details.price) AS total_revenue
FROM products
JOIN order_details
    ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name;
SELECT * FROM product_sales_summary;

DELIMITER //

CREATE PROCEDURE get_customer_orders(IN customerId INT)
BEGIN
    SELECT
        orders.order_id,
        orders.order_date,
        orders.total_amount,
        orders.status
    FROM orders
    WHERE orders.customer_id = customerId;
END //

DELIMITER ;
CALL get_customer_orders(1);

CREATE INDEX idx_customer_email
ON customers(email);