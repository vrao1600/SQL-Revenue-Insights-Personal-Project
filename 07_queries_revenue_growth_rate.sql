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
