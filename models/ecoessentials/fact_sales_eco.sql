 {{ config(materialized = 'table', schema = 'dw_ecoessentials') }} 

  

SELECT o.order_id AS order_key, CAST(o.order_timestamp AS DATE) AS date_key, o.customer_id  AS customer_key, ol.product_id AS product_key, ol.order_line_id, ol.quantity AS quantity_sold, ol.quantity * p.price AS total_amount, ol.discount AS discount_amount  

FROM {{ source('ecoessentials_landing', 'order_line') }} ol JOIN {{ source('ecoessentials_landing', 'order') }} o ON ol.order_id = o.order_id LEFT JOIN {{ source('ecoessentials_landing', 'product') }} p ON ol.product_id = p.product_id 

 