DROP TABLE IF EXISTS gold.customer_ltv;
GO

CREATE TABLE gold.customer_ltv (
    customer_sk     INT,
    full_name       VARCHAR(100),
    lifetime_value  DECIMAL(14,2),
    total_orders    INT
);
GO

INSERT INTO gold.customer_ltv
SELECT
    dc.customer_sk,
    dc.full_name,
    SUM(fs.revenue) AS lifetime_value,
    COUNT(DISTINCT fs.order_id) AS total_orders
FROM gold.fact_sales  fs
JOIN gold.dim_customer dc 
    ON fs.customer_sk = dc.customer_sk
GROUP BY 
    dc.customer_sk, 
    dc.full_name;
GO
