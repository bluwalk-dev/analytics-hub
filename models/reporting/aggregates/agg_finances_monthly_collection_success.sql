WITH debtCollectionNonCash AS (
    SELECT
        year_month,
        ROUND(sum(amount_recovered),2) amount_non_cash
    FROM {{ ref('fct_user_financial_debt_collection') }}
    WHERE payment_journal_type != 'bank'
    GROUP BY year_month
    ORDER BY year_month DESC
)

SELECT
    a.year_month,
    (c.amount_recovered - b.amount_non_cash) / (a.amount_invoiced - b.amount_non_cash) collection_success_ratio
FROM {{ ref('agg_finances_monthly_debt_invoiced') }} a
LEFT JOIN {{ ref('agg_finances_monthly_debt_collection') }} c ON a.year_month = c.year_month
LEFT JOIN debtCollectionNonCash b ON a.year_month = b.year_month
ORDER BY a.year_month DESC