SELECT
    full_name,
    SUM(revenue) AS total_revenue
FROM gold.sales_flat
GROUP BY full_name
ORDER BY total_revenue DESC;
