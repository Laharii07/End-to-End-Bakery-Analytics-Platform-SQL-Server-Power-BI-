SELECT
    product_name,
    product_category,
    SUM(revenue) AS revenue,
    SUM(quantity) AS units
FROM gold.sales_flat
GROUP BY product_name, product_category
ORDER BY revenue DESC;
