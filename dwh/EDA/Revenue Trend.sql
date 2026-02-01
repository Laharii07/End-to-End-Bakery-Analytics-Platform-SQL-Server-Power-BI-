SELECT
    calendar_date,
    SUM(revenue) AS daily_revenue
FROM gold.sales_flat
GROUP BY calendar_date
ORDER BY calendar_date;
