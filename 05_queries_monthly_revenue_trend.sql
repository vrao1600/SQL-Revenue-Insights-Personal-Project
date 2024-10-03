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
