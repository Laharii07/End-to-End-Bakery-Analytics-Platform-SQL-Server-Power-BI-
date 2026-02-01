ALTER TABLE gold.dim_customer
ADD street VARCHAR(100);
GO



UPDATE dc
SET dc.street = sc.street
FROM gold.dim_customer dc
JOIN silver.customers sc
    ON dc.customer_id = sc.customer_id;


SELECT
    dc.street,
    COUNT(DISTINCT fs.order_id) AS orders
FROM gold.fact_sales fs
JOIN gold.dim_customer dc
    ON fs.customer_sk = dc.customer_sk
GROUP BY dc.street
ORDER BY orders DESC;
