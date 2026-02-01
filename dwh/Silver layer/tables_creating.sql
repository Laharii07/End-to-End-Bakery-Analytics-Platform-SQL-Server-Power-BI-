

drop table if exists silver.customers;
go

create table silver.customers(
customer_id int primary key,
full_name varchar(100),
mobile_number varchar(10),
street varchar(10),
joined_date date
);
go

drop table if exists silver.products;
go

create table silver.products(
product_id int primary key,
product_name varchar(50),
product_category varchar(50),
is_customizable bit,
base_price decimal(10,2)
);
go

drop table if exists silver.orders;
go

create table silver.orders(
order_id int primary key,
customer_id int,
order_date date,
order_channel varchar(50),
total_items int,
total_order_value decimal(12,2)
);
go

drop table if exists silver.order_items;
go

create table silver.order_items(
order_item_id int primary key,
order_id int,
product_id int,
quantity int,
customization_details varchar(255),
item_price decimal(12,2)
);
go
