{{ config(materialized='table') }}

with

source as (
    select
        *
    from {{ source('drivfit_hubspot', 'deal_contact') }}
),

transformation as (

    SELECT
    
        *

    FROM source

)

SELECT * FROM transformation