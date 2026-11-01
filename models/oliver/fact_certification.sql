{{ config(
    materialized='table',
    schema='dw_oliver'
) }}

select emp.employee_key,
dt.date_key,
cert.certification_name,
cert.certification_cost
from {{ ref('stg_employee_certifications')}} as cert 
join {{ ref('oliver_dim_employee')}} as emp
    on cert.employee_id = emp.employee_id
join {{ ref('oliver_dim_date')}} as dt
    on cert.certification_awarded_date = dt.date_day
