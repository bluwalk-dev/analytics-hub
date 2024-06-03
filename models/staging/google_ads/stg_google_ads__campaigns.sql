WITH source AS (
    SELECT
        *
    FROM {{ source('google_ads', 'campaigns') }}
),

transformation AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY loaded_at DESC) AS __row_number
    FROM
        source
)

SELECT
    * EXCEPT (__row_number)
FROM
    transformation
WHERE
    __row_number = 1