
  {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.date_day,
p.product_name,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
s.total_amount
FROM {{ ref('fact_sales') }} s

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON s.customer_key = c.customer_key

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON s.employee_key = e.employee_key

LEFT JOIN {{ ref('oliver_dim_product') }} p
    ON s.product_key = p.product_key

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON s.date_key = d.date_key
