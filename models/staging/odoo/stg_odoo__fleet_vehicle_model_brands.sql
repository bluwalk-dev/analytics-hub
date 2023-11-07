with

source as (
    select
        *
    from {{ source('google_cloud_postgresql_public', 'fleet_vehicle_model_brand') }}
),

transformation as (

    select
        
        *  EXCEPT(_fivetran_synced, _fivetran_deleted)

    from source

)

select * from transformation
where _fivetran_deleted IS FALSE