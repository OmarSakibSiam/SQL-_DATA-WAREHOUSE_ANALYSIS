-- which categories contribute the most to overall sales
with category_sales AS (
SELECT 
category,
sum(sales_amount) as total_sales
FROM fact_sales f LEFT JOIN dim_products p ON p.product_key=f.product_key
group by category)

SELECT category,total_sales,
SUM(total_sales) over () as overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT)/SUM(total_sales) over ())*100,2),'%')AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC