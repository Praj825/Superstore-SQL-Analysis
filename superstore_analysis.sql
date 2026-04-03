CREATE DATABASE superstore_db;
use superstore_db;
CREATE TABLE  sales (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,4),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,4)
);
select count(*) from sales;
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(*) AS total_orders
    FROM sales;
    
SELECT 
  region,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

    SELECT 
   sub_category,
   ROUND(SUM(sales), 2) AS total_sales,
   ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10 ;
   
   SELECT
  sub_category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10;

SELECT
  discount,
  COUNT(*) AS total_orders,
  ROUND(AVG(profit), 2) AS avg_profit
FROM sales
GROUP BY discount
ORDER BY discount ASC;

SELECT
  segment,
  COUNT(*) AS total_orders,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

SELECT
  ship_mode,
  COUNT(*) AS total_orders,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(AVG(sales), 2) AS avg_order_value,
  ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY ship_mode
ORDER BY total_orders DESC;

SELECT
  state,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

SELECT
  segment,
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY segment, category
ORDER BY segment, profit_margin_pct DESC;

SELECT
  category,
  sub_category,
  discount,
  ROUND(sales, 2) AS sales,
  ROUND(profit, 2) AS profit
FROM sales
WHERE discount >= 0.3 AND profit < 0
ORDER BY profit ASC
LIMIT 15;