{{ config(materialized='table') }}

with

source as (
    select
        *
    from {{ source('odoo_realtime', 'insurance_policy_type') }}
),

transformation as (

    select
        
        *

    from source
    
)

select * from transformation