print '============================================='
print 'loading bronze layer'
print '========================================='

print '============================================'
print 'customers tables'
print '========================================='
bulk insert bronze.customers
from 'C:\Users\Administrator\OneDrive\Desktop\Project-1\data\customers.csv'
with(
firstrow = 2,
fieldterminator = ',',
tablock
);

print '==========================================='
print ' products table'
print '==========================================='

bulk insert bronze.products
from 'C:\Users\Administrator\OneDrive\Desktop\Project-1\data\products.csv'
with(
firstrow = 2,
fieldterminator = ',',
tablock
);

print '================================================'
print 'orders'
print '================================================'

bulk insert bronze.orders
from 'C:\Users\Administrator\OneDrive\Desktop\Project-1\data\orders.csv'
with(
firstrow = 2,
fieldterminator = ',',
tablock
);

print '====================================================='
print' order_items'
print '==================================================='

bulk insert bronze.order_items
from 'C:\Users\Administrator\OneDrive\Desktop\Project-1\data\order_items.csv'
with(
firstrow = 2,
fieldterminator = ',',
tablock
);