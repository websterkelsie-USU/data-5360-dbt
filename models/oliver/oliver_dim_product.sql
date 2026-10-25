{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
product_id as product_key,
product_id,
product_name,
unit_price, 
description
FROM {{ source('oliver_landing', 'product') }}