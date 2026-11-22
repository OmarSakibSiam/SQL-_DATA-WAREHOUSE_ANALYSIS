# SQL Data Warehouse Analysis

## Project Overview

This project focuses on analyzing sales data using SQL to extract meaningful business insights through a series of analytical queries. It uses a structured data warehouse containing customer, product, and sales information to explore business performance, customer behavior, and product trends.

The project demonstrates the practical application of SQL for data analysis, including aggregations, Common Table Expressions (CTEs), window functions, joins, conditional logic, and date-based calculations.

## Objectives

- Analyze overall sales performance and business trends over time.
- Identify high-performing products and product categories.
- Understand customer purchasing behavior and spending patterns.
- Segment customers based on their spending and purchase history.
- Evaluate product performance using different business metrics.
- Generate customer and product reports to support data-driven decision-making.

## Dataset

The project uses three datasets representing the core components of the data warehouse:

| Dataset | Description |
|---|---|
| `dim_customers.csv` | Contains customer-related information. |
| `dim_products.csv` | Contains product details, categories, costs, and other attributes. |
| `fact_sales.csv` | Contains transactional sales information, including orders, quantities, and sales amounts. |

**Dataset Files:**
- [Customer Dataset](DATASETS/dim_customers.csv)
- [Product Dataset](DATASETS/dim_products.csv)
- [Sales Dataset](DATASETS/fact_sales.csv)

## SQL Analysis

The project includes the following analytical queries, organized into different business analysis categories.

### 1. Change Over Time Analysis

Analyzes yearly business performance by calculating total sales, the number of unique customers, and total quantities sold.

**Key Concepts:** `YEAR()`, `SUM()`, `COUNT(DISTINCT)`, `GROUP BY`, `ORDER BY`

[View SQL Script](Scripts/1.change_over_time_analysis.sql)

### 2. Cumulative Analysis

Examines monthly sales trends by calculating cumulative sales and moving average prices over time.

**Key Concepts:** Window Functions, `SUM() OVER()`, `AVG() OVER()`, `DATE_FORMAT()`

[View SQL Script](Scripts/2.cumulative_analysis.sql)

### 3. Performance Analysis

Evaluates yearly product sales performance by comparing individual product sales against their average sales and previous year's performance.

**Key Concepts:** CTEs, `AVG() OVER()`, `LAG()`, `CASE WHEN`, Window Functions

[View SQL Script](Scripts/3.performance_analysis.sql)

### 4. Part-to-Whole Analysis

Identifies how much each product category contributes to overall sales and calculates the percentage contribution of each category.

**Key Concepts:** CTEs, Aggregate Functions, Window Functions, Percentage Calculation

[View SQL Script](Scripts/4.part_to_whole_analysis.sql)

### 5. Customer Segmentation

Classifies customers into three groups based on their spending behavior and purchase history:

- **VIP:** Customers with at least 12 months of purchase history and spending above 5,000.
- **Regular:** Customers with at least 12 months of purchase history and spending of 5,000 or less.
- **New:** Customers with less than 12 months of purchase history.

The query also calculates the total number of customers in each segment.

**Key Concepts:** CTEs, `CASE WHEN`, `TIMESTAMPDIFF()`, Aggregate Functions

[View SQL Script](Scripts/5.customer_segmentation.sql)

### 6. Product Segmentation

Groups products into different cost ranges and calculates the number of products belonging to each range.

**Key Concepts:** CTEs, `CASE WHEN`, `COUNT()`, `GROUP BY`

[View SQL Script](Scripts/6.segmentaion.sql)

## SQL Reports

### 7. Customer Report

Creates a comprehensive customer-level report that consolidates customer information, purchasing behavior, and important business KPIs.

**Key Metrics:**
- Total orders
- Total sales
- Total quantity purchased
- Total distinct products purchased
- Customer lifespan
- Customer age groups
- Customer segments (VIP, Regular, New)
- Recency (months since last order)
- Average Order Value (AOV)
- Average Monthly Spend

**Key Concepts:** CTEs, Joins, Aggregations, `CASE WHEN`, Date Functions, KPI Calculations

[View SQL Script](Scripts/customer_report.sql)

### 8. Product Report

Creates a comprehensive product-level report to evaluate product performance, sales contribution, and purchasing trends.

**Key Metrics:**
- Product name, category, and subcategory
- Product cost
- Total orders
- Total customers
- Total sales
- Total quantity sold
- Product lifespan
- Recency (months since last sale)
- Product performance segments (High-Performer, Mid-Range, Low-Performer)
- Average Selling Price
- Average Order Revenue (AOR)
- Average Monthly Revenue

**Key Concepts:** CTEs, Joins, Aggregations, `CASE WHEN`, Date Functions, KPI Calculations

[View SQL Script](Scripts/product_report.sql)

## SQL Skills Demonstrated

This project demonstrates practical SQL skills, including:

- Data Aggregation: `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`
- Joins: `INNER JOIN`, `LEFT JOIN`
- Common Table Expressions (CTEs)
- Window Functions: `LAG()`, `SUM() OVER()`, `AVG() OVER()`
- Conditional Logic: `CASE WHEN`
- Date and Time Functions
- Data Segmentation
- Running Totals and Moving Averages
- Business KPI Calculations
- Analytical Reporting

## Tools & Technologies

- **SQL**
- **MySQL-compatible SQL syntax**
- **Relational Data Warehouse**
- **CSV Datasets**

## Repository Structure

```text
SQL-_DATA-WAREHOUSE_ANALYSIS/
│
├── DATASETS/
│   ├── dim_customers.csv
│   ├── dim_products.csv
│   └── fact_sales.csv
│
├── Scripts/
│   ├── 1.change_over_time_analysis.sql
│   ├── 2.cumulative_analysis.sql
│   ├── 3.performance_analysis.sql
│   ├── 4.part_to_whole_analysis.sql
│   ├── 5.customer_segmentation.sql
│   ├── 6.segmentaion.sql
│   ├── customer_report.sql
│   └── product_report.sql
│
└── README.md
```

## Conclusion

This project demonstrates how SQL can be used to transform raw transactional data into meaningful business insights. Through sales analysis, customer segmentation, product performance evaluation, and analytical reporting, it showcases the use of SQL for practical business intelligence and data analysis tasks.

The project strengthened my understanding of relational data, analytical SQL queries, window functions, and business-oriented reporting.
