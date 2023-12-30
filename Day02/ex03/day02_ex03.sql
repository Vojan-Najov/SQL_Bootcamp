WITH pv_days AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
),

all_days AS (
    SELECT generate_series::DATE AS missing_date
    FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day')
)

SELECT all_days.missing_date
FROM all_days
LEFT OUTER JOIN pv_days
    ON all_days.missing_date = pv_days.visit_date
WHERE pv_days.visit_date IS NULL
ORDER BY all_days.missing_date ASC;
