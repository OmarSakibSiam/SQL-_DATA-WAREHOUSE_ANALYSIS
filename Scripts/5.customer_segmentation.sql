/*Group customers into three segments based on their spending behavior:   
VIP: at least 12 months of history and spending more than €5,000.  
Regular: at least 12 months of history but spending €5,000 or less.   
New: lifespan less than 12 months.
AND find the total number of customers by each group*/

WITH customer_spending AS(
SELECT 
c.customer_key,
SUM(f.sales_amount) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
timestampdiff(month,MIN(order_date),MAX(order_date)) AS life_span
FROM fact_sales f LEFT JOIN dim_customers c on f.customer_key=c.customer_key
GROUP by c.customer_key),
total_customer AS(
SELECT 
customer_key,
CASE
    WHEN life_span >= 12 AND total_spending > 5000 THEN 'VIP'
    WHEN life_span >= 12 AND total_spending <= 5000 THEN 'Regular'
    ELSE 'New'
END AS customer_segment
FROM customer_spending)

SELECT
count(customer_key) AS totalcustomer,
customer_segment
FROM total_customer
GROUP BY customer_segment
ORDER BY totalcustomer desc








