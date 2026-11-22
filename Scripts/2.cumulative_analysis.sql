-- Cumulative Analysis
-- Calculate the total sales per month
-- and the running total of sales over time
-- and moving avarage 

SELECT 
order_date,
total_sales,
sum(total_sales) OVER (partition by order_date order by order_date) AS running_total_sales,
AVG(avg_price) over (order by order_date) AS moving_average_price
FROM
(
SELECT 
DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
From fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)t


