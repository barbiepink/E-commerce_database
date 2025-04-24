-- ✅ Create Tables

-- Drop existing tables if they exist
IF OBJECT_ID('orders', 'U') IS NOT NULL DROP TABLE orders;
IF OBJECT_ID('products', 'U') IS NOT NULL DROP TABLE products;
IF OBJECT_ID('users', 'U') IS NOT NULL DROP TABLE users;

-- Table: users
CREATE TABLE users1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- Table: products
CREATE TABLE products1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

-- Table: orders
CREATE TABLE orders1 (
    id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users1(id),
    FOREIGN KEY (product_id) REFERENCES products1(id)
);

-- Insert Data

INSERT INTO users1 (id, name, email) VALUES
(1, 'Ravi', 'ravi@example.com'),
(2, 'Sita', 'sita@example.com'),
(3, 'Aman', 'aman@example.com');

INSERT INTO products1 (id, name, price) VALUES
(1, 'Laptop', 50000.00),
(2, 'Phone', 20000.00),
(3, 'Headphones', 1500.00);

INSERT INTO orders1 (id, user_id, product_id, quantity, total_amount) VALUES
(1, 1, 1, 1, 50000.00),
(2, 2, 2, 2, 40000.00),
(3, 3, 3, 3, 4500.00),
(4, 1, 2, 1, 20000.00);

-- Basic Queries

SELECT * FROM users1;
SELECT * FROM orders1;
SELECT * FROM products1;

SELECT o.id AS order_id, u.name AS user_name, p.name AS product_name, o.quantity, o.total_amount
FROM orders1 o
JOIN users1 u ON o.user_id = u.id
JOIN products1 p ON o.product_id = p.id;

SELECT u.name, SUM(o.total_amount) AS total_spent
FROM users1 u
JOIN orders1 o ON u.id = o.user_id
GROUP BY u.name;

SELECT AVG(o.total_amount) AS avg_order_value FROM orders1 o;

SELECT u.name
FROM users1 u
JOIN orders1 o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING SUM(o.total_amount) > 30000;

-- Create Views (run each separately)

GO
CREATE VIEW user_spending_summary AS
SELECT 
    u.id AS user_id,
    u.name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM users1 u
JOIN orders1 o ON u.id = o.user_id
GROUP BY u.id, u.name;

GO
CREATE VIEW view_unique_products_ordered AS
SELECT DISTINCT p.id, p.name, p.price
FROM products1 p
JOIN orders1 o ON p.id = o.product_id;

GO
CREATE VIEW viewlatest_order AS
SELECT TOP 5 * FROM orders1
ORDER BY id DESC;


-- Optimization
CREATE INDEX idx_user_id ON orders1(user_id);
