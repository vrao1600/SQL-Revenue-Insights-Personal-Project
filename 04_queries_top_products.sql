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
