-- Analyze the yearly performance of products by comparing each product's sales to both its average sales performance and the previous year's sales.

WITH yearly_product_sales AS (
SELECT YEAR(f.order_date) AS order_year ,
p.product_name, 
SUM(f.sales_amount) as current_sales
FROM fact_sales f LEFT JOIN dim_products p on f.product_key=p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date), p.product_name)
SELECT 
order_year,
product_name,
current_sales,
AVG(current_sales) OVER (partition by product_name) as avg_sales,
current_sales - AVG(current_sales) OVER (partition by product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER (partition by product_name) >0 Then 'Above Average'
	 WHEN current_sales - AVG(current_sales) OVER (partition by product_name) < 0 Then 'Below Average'
	 ELSE 'AVG'
END avg_change,
LAG(current_sales) over (partition by product_name order by order_year) AS prev_year_sales,
CASE WHEN current_sales - LAG(current_sales) over (partition by product_name order by order_year) >0 Then 'Increase'
	 WHEN LAG(current_sales) over (partition by product_name order by order_year) < 0 Then 'Decrease'
	 ELSE 'No change'
END py_change
FROM yearly_product_sales
order by product_name, order_year