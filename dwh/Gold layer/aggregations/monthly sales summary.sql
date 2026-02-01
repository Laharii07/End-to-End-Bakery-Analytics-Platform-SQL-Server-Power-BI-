DROP TABLE IF EXISTS gold.monthly_sales;
GO

CREATE TABLE gold.monthly_sales (
    year           INT,
    month          INT,
    month_name     VARCHAR(20),
    total_revenue  DECIMAL(14,2),
    total_units    INT,
    total_orders   INT
);
GO

INSERT INTO gold.monthly_sales
SELECT
    dd.year,
    dd.month,
    dd.month_name,
    SUM(fs.revenue) AS total_revenue,
    SUM(fs.quantity) AS total_units,
    COUNT(DISTINCT fs.order_id) AS total_orders
FROM gold.fact_sales fs
JOIN gold.dim_date dd 
    ON fs.date_sk = dd.date_sk
GROUP BY 
    dd.year, 
    dd.month, 
    dd.month_name;
GO
