{{ config(materialized='table') }}

SELECT * FROM (
    SELECT DISTINCT

        c.date,
        c.year_week,
        c.year_month,
        a.user_id,
        a.contact_id,
        b.partner_key,
        b.partner_marketplace,
        b.partner_category,
        b.partner_name
    FROM {{ ref('fct_financial_user_transactions') }} a
    LEFT JOIN {{ ref('fct_work_orders') }} b ON a.order_id = b.work_order_id
    LEFT JOIN {{ ref('util_calendar') }} c ON a.date = c.date
    WHERE 
        a.order_type = 'Work' AND 
        extract(year from a.date) >= 2020
)
ORDER BY date DESC, user_id DESC