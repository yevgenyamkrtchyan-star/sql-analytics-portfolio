SELECT * FROM public.customers LIMIT 10;

SELECT * FROM public.employees LIMIT 10;

SELECT * FROM public.orders LIMIT 10;

SELECT * FROM public.products LIMIT 10;

SELECT * FROM public.sales LIMIT 10;
ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);
ALTER TABLE employees
DROP CONSTRAINT uq_employees_email;

ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);

SELECT
    s.transaction_id,

    o.order_date,
    DATE(o.order_date) AS order_date_date,
    o.year,
    o.quarter,
    o.month,

    c.customer_name,
    c.city,
    c.zip_code,

    p.product_name,
    p.category,
    p.price,

    e.first_name  AS employee_first_name,
    e.last_name   AS employee_last_name,
    e.salary      AS employee_salary,

    s.quantity,
    s.discount,
    s.total_sales

FROM sales AS s
JOIN orders AS o
    ON s.order_id = o.order_id
JOIN customers AS c
    ON s.customer_id = c.customer_id
JOIN products AS p
    ON s.product_id = p.product_id
LEFT JOIN employees AS e
    ON s.employee_id = e.employee_id;
	SELECT
    transaction_id,
    order_date_date,
    year,
    product_name,
    total_sales
FROM sales_analysis
WHERE year = 2023
  AND total_sales > 10000;
  SELECT
    transaction_id,
    product_name,
    category,
    total_sales
FROM sales_analysis
WHERE category = 'Electronics';
SELECT
    transaction_id,
    order_date_date,
    year,
    product_name,
    total_sales
FROM sales_analysis
WHERE year = 2023
  AND total_sales > 10000;
  SELECT
    transaction_id,
    city,
    category,
    total_sales
FROM sales_analysis
WHERE city = 'East Amanda'
  AND category = 'Electronics';
  SELECT
    transaction_id,
    order_date_date,
    city,
    total_sales
FROM sales_analysis
WHERE city = 'East Amanda'
   OR city = 'Smithside';
   SELECT
    transaction_id,
    product_name,
    category,
    total_sales
FROM sales_analysis
WHERE category = 'Toys'
   OR category = 'Books';
   SELECT
    transaction_id,
    order_date_date,
    total_sales
FROM sales_analysis
WHERE total_sales BETWEEN 50000 AND 150000;
SELECT
    transaction_id,
    year,
    total_sales
FROM sales_analysis
WHERE year BETWEEN 2022 AND 2024;
SELECT
    transaction_id,
    city,
    total_sales
FROM sales_analysis
WHERE city IN ('East Amanda', 'Smithside', 'Lake Thomas');
SELECT
    transaction_id,
    product_name,
    category,
    total_sales
FROM sales_analysis
WHERE category IN ('Electronics', 'Books');
SELECT
    transaction_id,
	city,
	total_sales
FROM sales_analysis
WHERE city LIKE 'East%';
SELECT
   AVG(total_sales) as avg_sales
FROM sales_analysis
SELECT
  COUNT(customer_name)as number_of_customers,
  CASE
  WHEN AVG(total_sales)> 251 THEN 'Above Average'
  WHEN AVG(total_sales)= 251 THEN 'Average'
  WHEN AVG(total_sales)< 251 THEN 'Below Average'
  ElSE 'Warning'
  END as Segment
FROM sales_analysis
GROUP BY customer_name
SELECT
  customer_name,
  CASE
  WHEN AVG(total_sales)> 251 THEN 'Above Average'
  WHEN AVG(total_sales)= 251 THEN 'Average'
  WHEN AVG(total_sales)< 251 THEN 'Below Average'
  END as segment
FROM sales_analysis
GROUP BY customer_name;