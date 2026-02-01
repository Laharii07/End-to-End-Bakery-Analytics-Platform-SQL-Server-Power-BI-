CREATE OR ALTER PROCEDURE silver.sp_load_customers
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE silver.customers;

    INSERT INTO silver.customers (
        customer_id,
        full_name,
        mobile_number,
        street,
        joined_date
    )
    SELECT 
        TRY_CAST(customer_id AS INT),

        LTRIM(RTRIM(
            CONCAT(
                first_name,
                CASE
                    WHEN last_name IS NOT NULL AND last_name <> ''
                        THEN ' ' + last_name
                    ELSE ''
                END
            )
        )) AS full_name,

        mobile_number,

        street,

        joined_date


    FROM bronze.customers
    WHERE TRY_CAST(customer_id AS INT) IS NOT NULL;
END;
GO

create or alter procedure silver.sp_load_products
as
begin
set nocount on;
truncate table silver.products;
insert into silver.products(
product_id,
product_name,
product_category,
is_customizable,
base_price
)
select 
try_cast(product_id as int),
product_name,
product_category,

case
when lower(is_customizable) in('true','1','yes') then 1
when lower(is_customizable) in('false','0','no') then 0
else null
end,
try_cast(replace(base_price,',','') as decimal(10,2))
from bronze.products
where try_cast(product_id as int) is not null;
end;
go

create or alter procedure silver.sp_load_orders
as
begin
set nocount on;
truncate table silver.orders;
insert into silver.orders(
order_id,
customer_id,
order_date,
order_channel,
total_items,
total_order_value
)
select
try_cast(order_id as int),
try_cast(customer_id as int),
try_convert(date, order_date,120),
order_channel,
try_cast(total_items as int),
try_cast(replace(total_order_value,',','') as decimal(12,2))
from bronze.orders
where try_cast(order_id as int) is not null;
end;
go

create or alter procedure silver.sp_load_order_items
as
begin
set nocount on;
truncate table silver.order_items;
insert into silver.order_items(
order_item_id,
order_id,
product_id,
quantity,
customization_details,
item_price
)
select 
try_cast(order_item_id as int),
try_cast(order_id as int),
try_cast(product_id as int),
try_cast(quantity as int),
nullif(customization_details,''),
try_cast(replace(item_price,',','') as decimal(12,2))
from bronze.order_items
where try_cast(order_item_id as int) is not null
end;
go

