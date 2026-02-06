CREATE DATABASE super_store;

USE super_store;

SELECT * FROM store;

-- Q1. what is the total revenue by category?

SELECT 
category,sum(sales) as total_sales 
FROM store
GROUP BY category;

-- Q2. Region wise total sales?

SELECT 
region,sum(sales) as total_sales 
FROM store
GROUP BY region;

-- Q3. The number of products sold in each category across different city?

SELECT 
city,category,count(*) as no_of_products
FROM store
GROUP BY city,category
ORDER BY count(*) DESC
limit 10;

-- Q4. How many sales were made for each sub-category in every region?

SELECT
region,sub_category,count(*) as no_of_products
FROM store
GROUP BY sub_category,region
ORDER BY count(*) DESC
limit 10;

-- Q5. Mounthly wise total sales?

SELECT 
month,year,sum(sales) as total_sales
FROM store
GROUP BY month,year
ORDER BY year desc,month asc;

-- Q6. find profit or loss?

WITH Profit as
(SELECT 
month,year,round(sum(sales)) as total_sales
FROM store
GROUP BY month,year
ORDER BY year desc,month asc)

SELECT
*,total_sales - LAG(total_sales) OVER(ORDER BY year, month) as comparision
FROM profit;

