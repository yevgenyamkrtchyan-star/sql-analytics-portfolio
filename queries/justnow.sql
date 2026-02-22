-- Task 1: Complex Transaction Segmentation

SELECT
    transaction_id,
    city,
    category,
    total_sales,
    
    CASE
        WHEN total_sales >= 1000 
             AND discount < 0.10
        THEN 'High Value - Low Discount'

        WHEN total_sales BETWEEN 500 AND 999
             AND discount BETWEEN 0.10 AND 0.25
        THEN 'Medium Value - Moderate Discount'

        WHEN total_sales < 500
             OR discount > 0.30
        THEN 'Low Value or Heavy Discount'

        ELSE 'Standard Transaction'
    END AS transaction_segment

FROM sales_analysis

WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

SELECT
	SUM(total_sales) AS total_revenue
FROM sales_analysis
SELECT
 *
FROM customers_raw_text
SELECT
	raw_phone,
	REGEXP_REPLACE(raw_ph)