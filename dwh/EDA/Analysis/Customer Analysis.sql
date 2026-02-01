select
customer_sk,
count(distinct order_id) as orders
from gold.fact_sales
group by customer_sk
order by orders desc;