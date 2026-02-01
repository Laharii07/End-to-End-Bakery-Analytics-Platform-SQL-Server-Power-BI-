select 
order_channel,
sum(revenue) as revenue
from gold.fact_sales fs
join gold.dim_channel dc on fs.channel_sk = dc.channel_sk
group by order_channel;