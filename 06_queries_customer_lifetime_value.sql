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
