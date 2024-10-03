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
