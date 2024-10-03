-- Full Revenue Report

-- Total Revenue by Product Category
SELECT 
    p.category,
    SUM(oi.total_price) AS total_revenue
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.product_id = p.product_id
GROUP BY 
    p.category;

-- Revenue by Region
SELECT 
    c.customer_region,
    SUM(o.total_amount) AS total_revenue
FROM 
    Orders o
JOIN 
    Customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_region;

-- Top 5 Highest Revenue-Generating Products
SELECT 
    p.product_name,
    SUM(oi.total_price) AS total_revenue
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_revenue DESC
LIMIT 5;

-- Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(o.total_amount) AS total_revenue
FROM 
    Orders o
GROUP BY 
    month
ORDER BY 
    month;

-- Customer Lifetime Value (CLV)
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS lifetime_value
FROM 
    Orders o
JOIN 
    Customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    lifetime_value DESC;

-- Revenue Growth Rate by Month
WITH revenue_by_month AS (
    SELECT 
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(o.total_amount) AS total_revenue
    FROM 
        Orders o
    GROUP BY 
        month
)
SELECT 
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS previous_month_revenue,
    ((total_revenue - LAG(total_revenue) OVER (ORDER BY month)) / LAG(total_revenue) OVER (ORDER BY month)) * 100 AS growth_rate
FROM 
    revenue_by_month;
