-- =====================================================================
-- Core Financial KPIs & Corporate Health Analytics
-- Metrics: Gross Revenue, Average Order Value (AOV), Cancellation & Return Rates
-- =====================================================================

WITH financial_metrics AS (
    SELECT 
        -- Gross top-line revenue generated across all sales
        SUM(total_amount) AS gross_revenue,
        
        -- Average Order Value (AOV) baseline calculation
        AVG(total_amount) AS average_order_value,
        
        -- Count metrics for operational health rates
        COUNT(order_id) AS total_orders,
        COUNT(CASE WHEN order_status = 'cancelled' THEN 1 END) AS cancelled_orders,
        COUNT(CASE WHEN order_status = 'returned' THEN 1 END) AS returned_orders
    FROM orders
)
SELECT 
    ROUND(gross_revenue, 2) AS gross_revenue_inr,
    ROUND(average_order_value, 2) AS average_order_value_inr,
    total_orders,
    
    -- Calculating percentage metrics to track bottom-line leaks
    ROUND((cancelled_orders * 100.0 / total_orders), 2) AS cancellation_rate_percentage,
    ROUND((returned_orders * 100.0 / total_orders), 2) AS return_rate_percentage
FROM financial_metrics;
