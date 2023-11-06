with

source as (
    select
        *
    from {{ source('hubspot', 'users') }}
),

transformation as (

    select
        
        * EXCEPT(_fivetran_deleted, _fivetran_synced)

    from source

)

select * from transformation