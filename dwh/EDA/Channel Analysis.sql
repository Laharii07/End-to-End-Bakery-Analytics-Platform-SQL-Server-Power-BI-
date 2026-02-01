SELECT
    dch.order_channel,
    SUM(fs.revenue) AS revenue,
    COUNT(DISTINCT fs.order_id) AS orders
FROM gold.fact_sales fs
JOIN gold.dim_channel dch 
    ON fs.channel_sk = dch.channel_sk
GROUP BY dch.order_channel;
