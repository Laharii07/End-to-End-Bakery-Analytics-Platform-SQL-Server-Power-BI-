select
month_name,
avg(total_revenue) as avg_revenue
from gold.monthly_sales
group by month_name
order by avg_revenue desc;