WITH last_version_events AS (
    SELECT * EXCEPT(__row_number) FROM
        (SELECT 
            *, 
            ROW_NUMBER() OVER (
                PARTITION BY event_id 
                ORDER BY load_timestamp DESC
            ) AS __row_number
        FROM {{ ref("stg_predict_hq__events") }} 
        )
    WHERE __row_number = 1
)

SELECT
    a.location_id,
    a.event_id,
    a.event_title,
    b.venue_id,
    b.venue_name,
    a.event_description,
    a.event_category,
    a.event_labels,
    a.event_rank,
    a.event_local_rank,
    a.event_phq_attendance,
    a.event_start_date,
    a.event_end_date,
    a.event_geo_latitude,
    a.event_geo_longitude,
    a.event_navigation_link,
    a.event_geo_point,
    a.event_country_code
FROM last_version_events a
LEFT JOIN {{ ref("base_predict_hq_entities") }} b ON a.event_id = b.event_id
WHERE 
    event_category IN ('conferences', 'concerts', 'community', 'sports', 'performing-arts', 'expos', 'festivals') AND
    location_id IS NOT NULL
ORDER BY event_start_date ASC