select
product_name,
sum(revenue) as revenue
from gold.sales_flat
group by product_name
order by revenue desc;