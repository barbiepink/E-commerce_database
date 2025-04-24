# E-commerce_database
 sql language
Task 3: SQL for Data Analysis

Use SQL queries to analyze e-commerce data.


Assumed tables:
- `users(id, name, email, join_date)`
- `orders(id, user_id, order_date, total_amount)`
- `products(id, name, price)`
- `order_items(order_id, product_id, quantity)`


- MySQL (can also use SQLite/PostgreSQL)


- Selected, filtered, and sorted data using `SELECT`, `WHERE`, `ORDER BY`
- Aggregated data using `SUM`, `AVG`, `GROUP BY`
- Used `INNER JOIN` to link tables
- Applied subqueries
- Created a view for user order summaries
- Indexed `user_id` in `orders` table for optimization


