(
    SELECT
        order_date AS action_date,
        (
            SELECT name
            FROM person AS p
            WHERE po.person_id = p.id
        ) AS person_name
    FROM person_order AS po
)
INTERSECT
(
    SELECT
        visit_date AS action_date,
        (
            SELECT name
            FROM person AS p
            WHERE pv.person_id = p.id
        ) AS person_name
    FROM person_visits AS pv
)
ORDER BY action_date ASC, person_name DESC;

/*
(
    SELECT
        po.order_date AS action_date,
        p.name AS person_name
    FROM person_order AS po
    INNER JOIN person AS p ON po.person_id = p.id
)
INTERSECT
(
    SELECT
        pv.visit_date AS action_date,
        p.name AS person_name
    FROM person_visits AS pv
    INNER JOIN person AS p ON pv.person_id = p.id
)
ORDER BY action_date ASC, person_name DESC;
*/
