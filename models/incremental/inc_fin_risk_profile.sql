WITH open_vehicle_contracts AS (
    SELECT *
    FROM {{ ref('dim_vehicle_contracts') }}
    WHERE 
        end_date IS NULL AND
        vehicle_contract_type = 'car_rental' AND
        vehicle_contract_state = 'open'
)

SELECT 
    x.*
    /*
    IF(ROUND(IFNULL(y.risk_balance, 0), 2) = ROUND(IFNULL(x.balance, 0), 2), TRUE, FALSE),
    IF(ROUND(IFNULL(y.risk_deposit_amount, 0), 2) = ROUND(IFNULL(x.deposit, 0), 2), TRUE, FALSE),
    IF(ROUND(IFNULL(y.risk_net_balance, 0), 2) = ROUND(IFNULL(x.balance, 0), 2), TRUE, FALSE),
    IF(ROUND(IFNULL(y.risk_next_installment, 0), 2) = ROUND(IFNULL(x.next_installment, 0), 2), TRUE, FALSE),
    IF(ROUND(IFNULL(y.risk_target_balance, 0), 2) = ROUND(IFNULL(x.target_balance, 0), 2), TRUE, FALSE)*/
FROM (
    SELECT
        b.user_id,
        b.user_email,
        c.vehicle_plate as active_car_rental,
        a.deposit,
        a.outstanding_balance as balance,
        CASE
            WHEN a.outstanding_balance < -200 AND c.vehicle_plate IS NOT NULL THEN a.outstanding_balance + 200
            WHEN a.outstanding_balance < 0 AND c.vehicle_plate IS NOT NULL THEN 0
            ELSE NULL
        END as target_balance,
        CASE
            WHEN a.outstanding_balance < -200 AND c.vehicle_plate IS NOT NULL THEN 200
            WHEN a.outstanding_balance < 0 AND c.vehicle_plate IS NOT NULL THEN  -1 * a.outstanding_balance
            ELSE NULL
        END as next_installment,
        a.net_balance,
    FROM {{ ref('rpt_finances_collections_debt_report') }} a
    LEFT JOIN {{ ref('dim_users') }} b ON a.contact_id = b.contact_id
    LEFT JOIN open_vehicle_contracts c ON c.contact_id = a.contact_id
    WHERE 
        b.user_id IS NOT NULL AND
        b.user_email IS NOT NULL 
) x
LEFT JOIN {{ ref('base_hubspot_contacts') }} y ON x.user_id = y.user_id
WHERE
    y.user_id IS NOT NULL AND
    (
        ROUND(IFNULL(y.risk_balance, 0), 2) != ROUND(IFNULL(x.balance, 0), 2) OR
        ROUND(IFNULL(y.risk_deposit_amount, 0), 2) != ROUND(IFNULL(x.deposit, 0), 2) OR
        ROUND(IFNULL(y.risk_net_balance, 0), 2) != ROUND(IFNULL(x.net_balance, 0), 2) OR
        ROUND(IFNULL(y.risk_next_installment, 0), 2) != ROUND(IFNULL(x.next_installment, 0), 2) OR
        ROUND(IFNULL(y.risk_target_balance, 0), 2) != ROUND(IFNULL(x.target_balance, 0), 2) OR
        y.risk_active_rental_vehicle != x.active_car_rental
    )