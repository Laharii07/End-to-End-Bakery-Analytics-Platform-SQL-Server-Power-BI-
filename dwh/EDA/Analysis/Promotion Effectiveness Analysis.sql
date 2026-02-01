SELECT
    CASE 
        WHEN dd.calendar_date < '2024-02-01' THEN 'Before Promotion'
        ELSE 'After Promotion'
    END AS period,
    SUM(fs.revenue) AS total_revenue,
    COUNT(DISTINCT fs.order_id) AS orders
FROM gold.fact_sales fs
JOIN gold.dim_date dd
    ON fs.date_sk = dd.date_sk
GROUP BY
    CASE 
        WHEN dd.calendar_date < '2024-02-01' THEN 'Before Promotion'
        ELSE 'After Promotion'
    END;


SELECT
    CASE 
        WHEN dd.calendar_date >= DATEADD(DAY, -30, GETDATE())
             THEN 'Last 30 Days'
        ELSE 'Historical'
    END AS period,
    SUM(fs.revenue) AS revenue
FROM gold.fact_sales fs
JOIN gold.dim_date dd
    ON fs.date_sk = dd.date_sk
GROUP BY
    CASE 
        WHEN dd.calendar_date >= DATEADD(DAY, -30, GETDATE())
             THEN 'Last 30 Days'
        ELSE 'Historical'
    END;
