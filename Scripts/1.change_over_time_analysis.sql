-- Changes over year Analysis 

SELECT YEAR(order_date) as order_year,sum(sales_amount) as total_Sales,
COUNT(distinct customer_key) as total_customer,SUM(quantity) as total_quantity
From fact_sales
WHERE order_date is NOT NULL
group by Year(order_date)
ORDER BY YEAR(order_date)
