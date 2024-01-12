SELECT
    upa.partner_key,
    upa.sales_partner_id,
    upa.partner_name,
    upa.contact_id,
    u.user_id,
    ta.partner_account_uuid,
    ta.driver_name,
    ta.vehicle_plate,
    z.vehicle_contract_type,
    z.vehicle_contract_id,
    ta.accepted_time request_timestamp,
    ta.accepted_time_local request_local_time,
    ta.pickup_address,
    ta.drop_off_time as dropoff_timestamp,
    ta.drop_off_time_local as dropoff_local_time,
    ta.drop_off_address as address_dropoff,
    ta.ride_distance as trip_distance
FROM {{ ref('stg_bolt__trips') }} ta
LEFT JOIN {{ ref('dim_partners_accounts') }} upa on ta.partner_account_uuid = upa.partner_account_uuid
LEFT JOIN {{ ref('dim_users') }} u on u.contact_id = upa.contact_id
LEFT JOIN {{ ref('dim_vehicle_contracts') }} z ON ta.vehicle_plate = z.vehicle_plate
WHERE 
    (ta.accepted_time BETWEEN CAST(z.start_date AS TIMESTAMP) AND CAST(IFNULL(z.end_date, current_date) as TIMESTAMP) OR z.vehicle_plate IS NULL) AND
    order_state = 'finished'
ORDER BY accepted_time DESC