drop table if exists gold.fact_sales;
go

create table gold.fact_sales(
sales_sk bigint identity(1,1) primary key,
customer_sk int,
product_sk int,
date_sk int,
channel_sk int,
order_id int,
order_item_id int,
quantity int,
item_price decimal(12,2),
revenue decimal(12,2)
);
go

insert into gold.fact_sales(
customer_sk,
product_sk,
date_sk,
channel_sk,
order_id,
order_item_id,
quantity,
item_price,
revenue
)
select
dc.customer_sk,
dp.product_sk,
dd.date_sk,
dch.channel_sk,

o.order_id,
oi.order_item_id,

oi.quantity,
oi.item_price,
oi.quantity*oi.item_price as revenue

from silver.order_items oi
join silver.orders o
on oi.order_id = o.order_id

join gold.dim_customer dc
on o.customer_id = dc.customer_id

join gold.dim_product dp
on oi.product_id = dp.product_id

join gold.dim_date dd
on o.order_date = dd.calendar_date

join gold.dim_channel dch
on o.order_channel = dch.order_channel;