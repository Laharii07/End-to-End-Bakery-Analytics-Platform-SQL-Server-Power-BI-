SELECT
    full_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM gold.fact_sales fs
JOIN gold.dim_customer dc ON fs.customer_sk = dc.customer_sk
GROUP BY full_name
HAVING COUNT(DISTINCT order_id) > 1;
