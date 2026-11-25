CREATE DATABASE shopease_analytics;
USE shopease_analytics;
SHOW DATABASES;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    segment VARCHAR(50)
);
INSERT INTO customers
(customer_id, customer_name, city, segment)
VALUES
(101, 'Amit Sharma', 'Pune', 'Regular'),
(102, 'Neha Patil', 'Mumbai', 'Premium'),
(103, 'Rahul Verma', 'Delhi', 'Regular'),
(104, 'Sneha Joshi', 'Pune', 'Premium'),
(105, 'Arjun Mehta', 'Mumbai', 'Regular');
select * from customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(201, 'Laptop', 'Electronics', 50000),
(202, 'Mobile', 'Electronics', 25000),
(203, 'Headphones', 'Electronics', 2000),
(204, 'Shoes', 'Fashion', 3000),
(205, 'T Shirt', 'Fashion', 800),
(206, 'Coffee', 'Grocery', 500);
select * from products;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    order_status VARCHAR(30)
);
INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity, order_status)
VALUES
(1001, 101, 201, '2026-01-05', 1, 'Delivered'),
(1002, 102, 202, '2026-01-07', 2, 'Delivered'),
(1003, 103, 203, '2026-01-10', 3, 'Pending'),
(1004, 101, 204, '2026-01-15', 2, 'Delivered'),
(1005, 104, 205, '2026-01-20', 5, 'Delivered'),
(1006, 105, 206, '2026-02-02', 10, 'Cancelled'),
(1007, 102, 201, '2026-02-05', 1, 'Delivered'),
(1008, 104, 202, '2026-02-10', 1, 'Pending'),
(1009, 103, 204, '2026-02-15', 2, 'Delivered'),
(1010, 105, 203, '2026-02-20', 2, 'Delivered');
select * from orders;
select * from customers;
select * from products;

ALTER TABLE orders       -- creating a foreign key on cutomers table
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders      -- creating  a foreign key on orders table 
ADD CONSTRAINT fk_orders_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

DESCRIBE orders;
SHOW CREATE TABLE orders;

-- total revenue by city 
SELECT
    c.city,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;

-- total revenue by category	
select p.category,sum(o.quantity*p.price)as revenue
from orders o
join products p on 
p.product_id=o.product_id
where o.order_status='Delivered'
Group by p.category
order by revenue desc;

-- top 3 customers by revenue 
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue DESC
LIMIT 3;

-- find the most sold product by quantity
SELECT
    p.product_name,
    SUM(o.quantity) AS total_quantity
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC;

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY month
ORDER BY month;

-- ORDER STATUS
SELECT
    order_status as Status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- identify customers who have never placed the order
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS not NULL;

-- Find products that have never been ordered
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- Find the highest revenue city
SELECT
    c.city,
    SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;

-- avg quantity per delivered order
SELECT
    AVG(quantity) AS average_quantity
FROM orders
WHERE order_status = 'Delivered';







