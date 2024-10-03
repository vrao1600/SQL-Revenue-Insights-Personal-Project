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
