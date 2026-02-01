Select
year,
month_name,
sum(total_revenue) as revenue,
sum(total_orders) as orders
from gold.monthly_sales
group by year, month_name
order by year;