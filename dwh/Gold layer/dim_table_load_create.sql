

drop table if exists gold.dim_customer;
go

create table gold.dim_customer(
customer_sk  int identity(1,1) primary key,
customer_id int,
full_name varchar(100),
mobile_number varchar(10),
joined_date date
);
go

insert into gold.dim_customer(
customer_id, full_name,mobile_number,joined_date
)
select distinct
customer_id,
full_name,
mobile_number,
joined_date
from silver.customers;

drop table if exists gold.dim_product;
go
create table gold.dim_product(
product_sk int identity(1,1) primary key,
product_id int,
product_name varchar(50),
product_category varchar(50),
is_customizable bit,
base_price decimal(10,2)
);
go

insert into gold.dim_product
select distinct
product_id,
product_name,
product_category,
is_customizable,
base_price
from silver.products;

drop table if exists gold.dim_date;
go
create table gold.dim_date(
date_sk int identity(1,1) primary key,
calendar_date date,
year int,
month int,
month_name varchar(20),
quater int,
day_of_week varchar(20)
);
go

insert into gold.dim_date
select distinct
d,
year(d),
month(d),
datename(month,d),
datepart(QUARTER,d),
datename(weekday,d)
from (
select order_date as d from silver.orders
) x
where d is not null;

drop table if exists gold.dim_channel;
go
create table gold.dim_channel(
channel_sk int identity(1,1) primary key,
order_channel varchar(50)
);
go

insert into gold.dim_channel
select distinct order_channel
from silver.orders;
