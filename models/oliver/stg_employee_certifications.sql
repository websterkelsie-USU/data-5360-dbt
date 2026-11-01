{{ config(
    materialized='table',
    schema='dw_oliver'
) }}

select employee_id,
parse_json(certification_json):certification_name::VARCHAR AS certification_name,
parse_json(certification_json):certification_cost::FLOAT AS certification_cost,
parse_json(certification_json):certification_awarded_date::DATE AS certification_awarded_date

from {{ source("oliver_landing", "employee_certifications")}}

