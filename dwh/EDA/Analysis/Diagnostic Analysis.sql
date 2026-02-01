select
product_category,
avg(revenue) as historical_avg,
sum(case when calendar_date >= DATEADD(day,-30,getdate())
then revenue else 0 end) as last_30_days_revenue,
avg(case when calendar_date >= DATEADD(day,-30,getdate())
then revenue else 0 end) as last_30_days_avg_revenue
from gold.sales_flat
group by product_category;