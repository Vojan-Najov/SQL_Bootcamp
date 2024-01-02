CREATE VIEW v_symmetric_union AS
WITH r AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
),
s AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
)
(
    SELECT person_id FROM r
    EXCEPT
    SELECT person_id FROM s
)
UNION
(
    SELECT person_id FROM s
    EXCEPT
    SELECT person_id FROM r
)
ORDER BY person_id;
