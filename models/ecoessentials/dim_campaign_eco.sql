{{ config(materialized = 'table', schema = 'dw_ecoessentials') }} 

SELECT campaign_id AS campaign_key, campaign_id, campaign_name, campaign_discount 

FROM {{ source('ecoessentials_landing', 'promotional_campaign') }} 