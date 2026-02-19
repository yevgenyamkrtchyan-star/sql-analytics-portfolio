/* =====================================================
   Task 1 | Complex Transaction Segmentation
   ===================================================== */

SELECT
    transaction_id,
    city,
    category,
    total_sales,
    discount,
    CASE
        WHEN total_sales >= 1000 
             AND discount < 0.10 
             AND category = 'Electronics'
        THEN 'High Value Electronics - Low Discount'

        WHEN total_sales BETWEEN 500 AND 999
             AND discount BETWEEN 0.10 AND 0.25
        THEN 'Medium Value - Moderate Discount'

        WHEN total_sales < 500
             OR discount > 0.30
        THEN 'Low Value or Heavy Discount'

        WHEN city IN ('New York', 'Los Angeles')
             AND total_sales > 800
        THEN 'Premium City Transaction'

        ELSE 'Standard Transaction'
    END AS transaction_segment
FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';


/* =====================================================
   Task 2 | Category-Level Performance Analysis
   ===================================================== */

SELECT
    category,
    SUM(total_sales) AS total_category_sales,
    COUNT(*) AS transaction_count,
    AVG(discount) AS average_discount,
    CASE
        WHEN SUM(total_sales) > 50000 
             AND COUNT(*) > 200
        THEN 'Strong Performer'

        WHEN SUM(total_sales) BETWEEN 20000 AND 50000
        THEN 'Average Performer'

        ELSE 'Underperformer'
    END AS performance_label
FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY category
HAVING COUNT(*) > 20
ORDER BY total_category_sales DESC;


/* =====================================================
   Task 3 | City-Level Activity Analysis
   ===================================================== */

SELECT
    city,
    COUNT(*) AS transaction_volume,
    CASE
        WHEN COUNT(*) > 300
        THEN 'High Activity'

        WHEN COUNT(*) BETWEEN 100 AND 300
        THEN 'Medium Activity'

        ELSE 'Low Activity'
    END AS activity_tier
FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY city
HAVING COUNT(*) > 10
ORDER BY transaction_volume DESC;


/* =====================================================
   Task 4 | Discount Behavior Analysis
   ===================================================== */

SELECT
    category,
    AVG(discount) AS average_discount,
    SUM(total_sales) AS total_sales,
    CASE
        WHEN AVG(discount) > 0.30
        THEN 'Discount-Heavy'

        WHEN AVG(discount) BETWEEN 0.10 AND 0.30
        THEN 'Moderate Discount'

        ELSE 'Low or No Discount'
    END AS discount_behavior
FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY category
HAVING COUNT(*) > 15
ORDER BY average_discount DESC;
