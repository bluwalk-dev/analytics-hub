{{ config(materialized='table') }}

with

source as (
    select
        *
    from {{ source('odoo_realtime', 'insurance_policy_payment') }}
),

transformation as (

    select
        
        *

    from source
    
)

select * from transformation