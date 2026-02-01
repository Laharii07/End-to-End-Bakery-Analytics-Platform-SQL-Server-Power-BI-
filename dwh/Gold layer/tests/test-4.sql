select count(*) as total_rows
from gold.fact_sales;

SELECT
    SUM(CASE WHEN customer_sk IS NULL THEN 1 ELSE 0 END) AS null_customer,
    SUM(CASE WHEN product_sk IS NULL THEN 1 ELSE 0 END) AS null_product,
    SUM(CASE WHEN date_sk IS NULL THEN 1 ELSE 0 END) AS null_date,
    SUM(CASE WHEN channel_sk IS NULL THEN 1 ELSE 0 END) AS null_channel
FROM gold.fact_sales;

SELECT TOP 10
    quantity,
    item_price,
    revenue,
    (quantity * item_price) AS expected_revenue
FROM gold.fact_sales
WHERE revenue <> quantity * item_price;


SELECT
    order_id,
    SUM(revenue) AS calculated_order_total
FROM gold.fact_sales
GROUP BY order_id
ORDER BY calculated_order_total DESC;

SELECT
    order_id,
    order_item_id,
    COUNT(*) AS cnt
FROM gold.fact_sales
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS missing_customers
FROM gold.fact_sales fs
LEFT JOIN gold.dim_customer dc
    ON fs.customer_sk = dc.customer_sk
WHERE dc.customer_sk IS NULL;


SELECT COUNT(*) AS missing_products
FROM gold.fact_sales fs
LEFT JOIN gold.dim_product dp
    ON fs.product_sk = dp.product_sk
WHERE dp.product_sk IS NULL;


SELECT COUNT(*) AS missing_dates
FROM gold.fact_sales fs
LEFT JOIN gold.dim_date dd
    ON fs.date_sk = dd.date_sk
WHERE dd.date_sk IS NULL;


SELECT COUNT(*) AS missing_channels
FROM gold.fact_sales fs
LEFT JOIN gold.dim_channel dch
    ON fs.channel_sk = dch.channel_sk
WHERE dch.channel_sk IS NULL;


SELECT
    COUNT(*) AS fact_rows,
    COUNT(DISTINCT order_item_id) AS distinct_order_items
FROM gold.fact_sales;

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_sk) AS total_customers,
    SUM(revenue) AS total_revenue
FROM gold.fact_sales;
