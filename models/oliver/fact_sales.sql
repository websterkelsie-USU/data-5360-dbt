{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    st.store_key,
    c.customer_key,
    p.product_key,
    d.date_key,
    e.employee_key,
    ol.quantity,
    o.total_amount,
    ol.unit_price
FROM {{ source('oliver_landing', 'orders') }} o
INNER JOIN {{ source('oliver_landing', 'orderline') }} ol ON o.order_id = ol.order_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON ol.product_id = p.product_id
INNER JOIN {{ ref('oliver_dim_store') }} st ON o.store_id = st.store_id 
INNER JOIN {{ ref('oliver_dim_customer') }} c ON o.customer_ID = c.customer_id 
INNER JOIN {{ ref('oliver_dim_employee') }} e ON o.employee_id = e.employee_id 
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.date_day = o.order_date
