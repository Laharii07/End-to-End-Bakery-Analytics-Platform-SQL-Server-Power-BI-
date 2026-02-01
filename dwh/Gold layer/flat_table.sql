DROP TABLE IF EXISTS gold.sales_flat;
GO

CREATE TABLE gold.sales_flat (
    sales_sk        BIGINT,
    full_name       VARCHAR(100),
    product_name    VARCHAR(50),
    product_category VARCHAR(50),
    calendar_date   DATE,
    month_name      VARCHAR(20),
    year            INT,
    order_channel   VARCHAR(50),
    quantity        INT,
    item_price      DECIMAL(12,2),
    revenue         DECIMAL(12,2)
);
GO

INSERT INTO gold.sales_flat
SELECT
    fs.sales_sk,
    dc.full_name,
    dp.product_name,
    dp.product_category,
    dd.calendar_date,
    dd.month_name,
    dd.year,
    dch.order_channel,
    fs.quantity,
    fs.item_price,
    fs.revenue
FROM gold.fact_sales fs
JOIN gold.dim_customer dc ON fs.customer_sk = dc.customer_sk
JOIN gold.dim_product dp ON fs.product_sk = dp.product_sk
JOIN gold.dim_date dd ON fs.date_sk = dd.date_sk
JOIN gold.dim_channel dch ON fs.channel_sk = dch.channel_sk;
GO
