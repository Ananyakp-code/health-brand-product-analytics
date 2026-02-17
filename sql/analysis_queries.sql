/* =========================================================
Health Product Analytics Case Study
========================================================= */


/* ---------------------------------------------------------
Step 1: Business Health Metrics
Purpose:
- Create a customer-level revenue view
- Understand total customers, revenue, and AOV
--------------------------------------------------------- */

CREATE OR REPLACE VIEW customer_revenue AS
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(price) AS total_revenue,
    AVG(price) AS avg_order_value,
    MAX(is_subscription) AS is_subscriber
FROM orders
GROUP BY customer_id;

/* Overall business metrics */
SELECT
    COUNT(*) AS total_customers,
    SUM(total_revenue) AS total_revenue,
    AVG(avg_order_value) AS avg_order_value
FROM customer_revenue;


/* ---------------------------------------------------------
Step 2: Acquisition Analysis
Purpose:
- Identify top acquisition channels
- Understand geographic demand
--------------------------------------------------------- */

CREATE OR REPLACE VIEW acquisition_summary AS
SELECT
    acquisition_channel,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customers), 2
    ) AS percent_share
FROM customers
GROUP BY acquisition_channel;

SELECT * FROM acquisition_summary
ORDER BY customers DESC;


/* City-level acquisition */
CREATE OR REPLACE VIEW city_summary AS
SELECT
    city,
    COUNT(*) AS customers
FROM customers
GROUP BY city
ORDER BY customers DESC;

SELECT * FROM city_summary;


/* ---------------------------------------------------------
Step 3: Revenue Driver Analysis
Purpose:
- Identify top revenue-generating products
- Understand product-level contribution
--------------------------------------------------------- */

CREATE OR REPLACE VIEW product_revenue AS
SELECT
    product,
    COUNT(*) AS orders,
    SUM(price) AS revenue,
    AVG(price) AS avg_price
FROM orders
GROUP BY product
ORDER BY revenue DESC;

SELECT * FROM product_revenue;


/* ---------------------------------------------------------
Step 4: Customer Behaviour
Purpose:
- Measure repeat purchase rate
- Identify churn at first purchase
--------------------------------------------------------- */

CREATE OR REPLACE VIEW order_frequency AS
SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

/* Repeat vs one-time purchase rate */
SELECT
    ROUND(
        SUM(order_count > 1) * 100.0 / COUNT(*),
        2
    ) AS repeat_purchase_rate,
    ROUND(
        SUM(order_count = 1) * 100.0 / COUNT(*),
        2
    ) AS one_time_rate
FROM order_frequency;


/* ---------------------------------------------------------
Step 5: Time-Based Funnel Analysis
Purpose:
- Build correct funnel using event sequence
- Identify major drop-off stage
--------------------------------------------------------- */

CREATE OR REPLACE VIEW customer_funnel AS
SELECT
    customer_id,
    MIN(CASE WHEN event_type = 'view_product' THEN event_date END) AS view_date,
    MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_date,
    MIN(CASE WHEN event_type = 'checkout' THEN event_date END) AS checkout_date,
    MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_date
FROM events
GROUP BY customer_id;

/* Funnel stage counts */
SELECT
    COUNT(view_date) AS viewed,
    SUM(cart_date IS NOT NULL AND cart_date >= view_date) AS added_to_cart,
    SUM(checkout_date IS NOT NULL AND checkout_date >= cart_date) AS checked_out,
    SUM(purchase_date IS NOT NULL AND purchase_date >= checkout_date) AS purchased
FROM customer_funnel;

/* Funnel conversion rates */
SELECT
    ROUND(
        SUM(cart_date IS NOT NULL AND cart_date >= view_date) * 100.0 /
        COUNT(view_date), 2
    ) AS view_to_cart_rate,

    ROUND(
        SUM(checkout_date IS NOT NULL AND checkout_date >= cart_date) * 100.0 /
        SUM(cart_date IS NOT NULL AND cart_date >= view_date), 2
    ) AS cart_to_checkout_rate,

    ROUND(
        SUM(purchase_date IS NOT NULL AND purchase_date >= checkout_date) * 100.0 /
        SUM(checkout_date IS NOT NULL AND checkout_date >= cart_date), 2
    ) AS checkout_to_purchase_rate
FROM customer_funnel;


/* ---------------------------------------------------------
Step 6: Subscription LTV Analysis
Purpose:
- Compare subscriber vs non-subscriber LTV
- Prove value of retention and subscriptions
--------------------------------------------------------- */

CREATE OR REPLACE VIEW subscription_ltv AS
SELECT
    customer_id,
    MAX(is_subscription) AS is_subscriber,
    SUM(price) AS customer_revenue
FROM orders
GROUP BY customer_id;

SELECT
    is_subscriber,
    AVG(customer_revenue) AS avg_ltv
FROM subscription_ltv
GROUP BY is_subscriber;


/* =========================================================
EXPERIMENT SUPPORT QUERIES
Purpose:
Provide data-backed proof for the second-purchase incentive
========================================================= */


/* ---------------------------------------------------------
1. Size of churn segment
What this proves:
- How many customers buy only once
- Size of the target group for the experiment
--------------------------------------------------------- */

SELECT
    COUNT(*) AS one_time_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id) FROM orders),
        2
    ) AS percent_one_time
FROM (
    SELECT customer_id,
           COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) t
WHERE order_count = 1;


/* ---------------------------------------------------------
2. Revenue: One-time vs repeat customers
What this proves:
- Repeat customers generate higher LTV
- Second purchase directly increases revenue
--------------------------------------------------------- */

SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customers,
    AVG(total_revenue) AS avg_ltv
FROM (
    SELECT
        customer_id,
        COUNT(*) AS order_count,
        SUM(price) AS total_revenue
    FROM orders
    GROUP BY customer_id
) t
GROUP BY customer_type;


/* ---------------------------------------------------------
3. Average value of second order
What this proves:
- Monetary impact of converting a user to a second purchase
--------------------------------------------------------- */

WITH ranked_orders AS (
    SELECT
        customer_id,
        price,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS order_number
    FROM orders
)
SELECT
    AVG(price) AS avg_second_order_value
FROM ranked_orders
WHERE order_number = 2;


/* ---------------------------------------------------------
4. Product diversity per customer
What this proves:
- Cross-sell opportunity across products
--------------------------------------------------------- */

SELECT
    AVG(product_count) AS avg_products_per_customer
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT product) AS product_count
    FROM orders
    GROUP BY customer_id
) t;


/* ---------------------------------------------------------
5. Gut Cleanse penetration
What this proves:
- Adoption level of lowest-performing SKU
- Justifies using it as a complementary free product
--------------------------------------------------------- */

SELECT
    COUNT(DISTINCT customer_id) AS customers_bought_gut_cleanse,
    ROUND(
        COUNT(DISTINCT customer_id) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id) FROM orders),
        2
    ) AS penetration_percent
FROM orders
WHERE product = 'Gut Cleanse';


/* =========================================================
END OF SCRIPT
========================================================= */
