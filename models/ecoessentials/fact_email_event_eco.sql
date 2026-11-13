{{ config(materialized = 'table',  schema = 'dw_ecoessentials') }} 

SELECT ROW_NUMBER() OVER (ORDER BY m.emailid, m.customerid, m.eventtimestamp)        AS email_event_id, TRY_TO_NUMBER(m.customerid) AS customer_key, m.emailid AS email_key, m.campaignid AS campaign_key, et.event_type_key, CAST(m.eventtimestamp AS DATE) AS eventdate_key, 1 AS eventcount 

FROM {{ source('ecoessentials_marketing', 'marketing_emails') }} m LEFT JOIN {{ref('dim_event_type_eco') }} et ON m.eventtype = et.event_type 

WHERE m.eventtype IS NOT NULL 