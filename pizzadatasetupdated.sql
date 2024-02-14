CREATE DATABASE PIZZADB;
USE PIZZADB;

CREATE table pizzasales(
pizza_id int primary key not null,
order_id int,
pizza_name_id varchar(100),
quantity tinyint,
order_date date,
order_time time,
unit_price float,
total_price float,
pizza_size varchar(100),
pizza_category varchar(200),
pizza_ingredients varchar(500),
pizza_name varchar(200)
);

select * from pizzasales;

-- ------------------------------------PIZZA SALES SQL QUERIES------------------------------BY PINTU KUMAR DATA ANAYLST LOADING.........
-- A. KPI’s
-- 1. Total Revenue:
select * from pizzasales;
select round(sum(total_price) , 2)as Total_Revenue from pizzasales;

-- 2. Average Order Value
select * from pizzasales;

select round(sum(total_price) / count(distinct order_id),2) as avg_order_value from pizzasales;

-- 3. Total Pizzas Sold
select * from pizzasales;

select sum(quantity) as Total_Pizzas_Sold from pizzasales;

-- 4. Total Orders
select * from pizzasales;
select count(distinct order_id) as Total_Orders from pizzasales;

-- 5. Average Pizzas Per Order
select * from pizzasales;

select cast(cast(sum(quantity) as decimal(10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzasale
from pizzasales;

-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- B. Daily Trend for Total Orders
select * from pizzasales;
SELECT DATE_FORMAT(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizzasales
GROUP BY DATE_FORMAT(order_date);



SELECT DATE_FORMAT((order_date), '%M') as order_day, COUNT(distinct order_id) as Total_orders;

SELECT DAYNAME(order_date) AS day_of_week, COUNT(DISTINCT order_id) AS total_orders
FROM pizzasales
group by DAYNAME(order_date);

-- C. Hourly Trend for Orders


-- D. % of Sales by Pizza Category
select * from pizzasales;

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizzasales) as decimal(10,2)) as PCT
FROM pizzasales
group by pizza_category;

-- E. % of Sales by Pizza Size
select * from pizzasales;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizzasales) AS DECIMAL(10,2)) AS PCT
FROM pizzasales
GROUP BY pizza_size;

-- F. Total Pizzas Sold by Pizza Category

select * from pizzasales;
select pizza_category, sum(quantity) as Pizza_Sold
from pizzasales
group by pizza_category
order by Pizza_Sold desc;

-- G. Top 5 Best Sellers by Total Pizzas Sold
select * from pizzasales;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizzasales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

-- H. Bottom 5 Best Sellers by Total Pizzas Sold
select * from pizzasales;

select pizza_name, sum(quantity) as Total_sold_pizza
from pizzasales
group by pizza_name
order by Total_sold_pizza asc
limit 5;