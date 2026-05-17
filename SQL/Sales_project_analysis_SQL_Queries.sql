select count(*)
from sales_project

--to find total revenue(8761066)
select sum(quantity*unit_price) as total_revenue
from sales_project

--to find total orders(18402)
select count(distinct invoice_id) as total_orders
from sales_project

--to find total customer(4334)
select count(distinct customerid) as total_customers
from sales_project

--to find revenue by country(top country UK-7265862.23)
select country,sum(quantity*unit_price) as revenue
from sales_project
group by country
order by revenue DESC

--top 10 products(Papercraft, little birdie is the top product)
select product_name,sum(quantity) as total_sold
from sales_project
group by product_name
order by total_sold DESC 
limit 10

--top customers(high value users)--customer with id 14646 has spent the most 279138
select customerid,sum(quantity*unit_price) as total_spent
from sales_project
group by customerid
order by total_spent desc
limit 10

--monthly revenue trend
select year,month,sum(quantity*unit_price) as revenue
from sales_project
group by year,month
order by year, month

--customer purchase frequency(customer 12748 has purchased very frequently ~ 206 times)
select customerid,count(distinct invoice_id) as total_orders
from sales_project
group by customerid
order by total_orders desc 

--rfm analysis(recency frquency and monetary)(recency last purchase on 31-10-2011 by 15977)
select customerid,invoice_datetime
from sales_project
group by customerid
order by invoice_datetime desc

--frequency and monetary
select  customerid,count(distinct invoice_id) as frequency , sum(quantity*unit_price) as monetary
from sales_project
group by customerid 
order by monetary desc

--top vs low value customers
select customerid,sum(unit_price*quantity) as total_spent,
case 
	when  sum(unit_price*quantity)>1000 then 'Hign Value'
	When  sum(unit_price*quantity)>500  then 'Medium Value'
	Else 'Low Value'
End as customer_segment
from sales_project
group by customerid

--monthly revenue
select sum(quantity*unit_price) as revenue, month
from sales_project
group by month
order by revenue desc

--average order value
select sum(quantity*unit_price)/ count(distinct invoice_id) as avg_order_value
from sales_project



