-- =====================================================================
-- Conversion Funnel Analytics & Consumer Drop-Off Diagnostics
-- Methodology: Multi-stage CTEs mapping user sessions (View -> Cart -> Purchase)
-- =====================================================================

WITH funnel_base AS (
    SELECT 
        -- Aggregating total raw platform event touchpoints
        COUNT(CASE WHEN event_type = 'view' THEN 1 END) AS total_views,
        COUNT(CASE WHEN event_type = 'cart' THEN 1 END) AS total_carts,
        COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS total_purchases
    FROM events
),
funnel_conversions AS (
    SELECT 
        total_views,
        total_carts,
        total_purchases,
        
        -- Conversion steps tracking micro-level transitions
        ROUND((total_carts * 100.0 / total_views), 2) AS view_to_cart_rate,
        ROUND((total_purchases * 100.0 / total_carts), 2) AS cart_to_purchase_rate,
        ROUND((total_purchases * 100.0 / total_views), 2) AS overall_conversion_rate
    FROM funnel_base
)
SELECT 
    total_views AS stage_1_product_views,
    total_carts AS stage_2_cart_adds,
    total_purchases AS stage_3_completed_purchases,
    
    view_to_cart_rate AS view_to_cart_pct,
    cart_to_purchase_rate AS cart_to_purchase_pct,
    overall_conversion_rate AS end_to_end_conversion_pct
FROM funnel_conversions;
