use sales;

#--To Analyze the Tables
select * from customers;
select * from markets;
select * from products;
select * from transactions;
select * from date;

#-- Total Count of Customers Table = 30
select count(*) from customers;

#-- Total Count of Markets Table = 17
select count(*) from markets;

#-- Total Count of Products Table = 279
select count(*) from products;

#-- Total Count of Transactions Table = 150283
select count(*) from transactions;

#-- Total Count of Date Table = 1126
select count(*) from date;

#--Total Sum in Year 2017 = 93569152/-
select sum(transactions.sales_amount)  from transactions inner join date on transactions.order_date=date.date where date.year=2017;

#--Total Sum in Year 2018 = 414308941/-
select sum(transactions.sales_amount)  from transactions inner join date on transactions.order_date=date.date where date.year=2018;

#--Total Sum in Year 2019 = 336452114/-
select sum(transactions.sales_amount)  from transactions inner join date on transactions.order_date=date.date where date.year=2019;

#--Total Sum in Year 2020 = 142235559/-
select sum(transactions.sales_amount)  from transactions inner join date on transactions.order_date=date.date where date.year=2020;

#--Top 5 Customer based on Total Sales Amount:
select customers.custmer_name,sum(transactions.sales_amount) from customers inner join transactions on customers.customer_code=transactions.customer_code group by customers.custmer_name order by sum(transactions.sales_amount) desc limit 5;

#--Top 5 Selling Products:
select product_code, sum(sales_amount) from transactions group by product_code order by sum(sales_amount) desc limit 5;

#--Improper Value in Sales Amount = 1611
select count(*) from transactions where sales_amount <=0;