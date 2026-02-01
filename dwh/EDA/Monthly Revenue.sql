SELECT
    year,
    month_name,
    SUM(revenue) AS total_revenue
FROM gold.sales_flat
GROUP BY year, month_name
ORDER BY year;
