SELECT all_days::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS all_days
LEFT OUTER JOIN (
    SELECT visit_date
    FROM person_visits AS pv
    WHERE pv.person_id = 1 OR pv.person_id = 2
) AS pv_days
    ON all_days::DATE = pv_days.visit_date
WHERE pv_days.visit_date IS NULL
ORDER BY missing_date ASC;

/*
WITH pv_days AS (
    SELECT pv.visit_date
    FROM person_visits AS pv
    WHERE pv.person_id = 1 OR pv.person_id = 2
)

SELECT all_days::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS all_days
LEFT OUTER JOIN pv_days
    ON all_days::DATE = pv_days.visit_date
WHERE pv_days.visit_date IS NULL
ORDER BY missing_date ASC;
*/
