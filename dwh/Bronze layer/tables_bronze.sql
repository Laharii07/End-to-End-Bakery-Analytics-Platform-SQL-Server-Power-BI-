DROP TABLE IF EXISTS bronze.customers;
GO

CREATE TABLE bronze.customers (
    customer_id int not null,
    first_name varchar(50) null,
    last_name varchar(50) null,
    mobile_number varchar(50) null,
    street varchar(50) null,
    city varchar(50) null,
    state varchar(50) null,
    joined_date varchar(50) null  
);
GO

 
drop table if exists bronze.products;
go

create table bronze.products(
 product_name varchar(50) null,
 product_category varchar(50) null,
 is_customizable varchar(50) null,
 base_price varchar(50) null,
 product_id int not null
 );
 go
 
 
 
 drop table if exists bronze.orders;
 go

 create table bronze.orders(
 order_id int not null,
 order_date date null,
 customer_id varchar(50) null,
 order_channel varchar(50) null,
 order_status varchar(50) null,
 total_items int null,
 total_order_value int null
 );
 go
 
 
 
 drop table if exists bronze.order_items;
 go

 create table bronze.order_items(
 order_item_id int not null,
 order_id int null,
 product_id int null,
 quantity int null,
 customization_details varchar(255) null,
 item_price varchar(50) null
 );
 go
 