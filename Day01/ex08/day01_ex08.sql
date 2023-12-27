SELECT
    po.order_date,
    CONCAT(
        p.name,
        ' (age:',
        p.age,
        ')'
    ) AS person_information
FROM (
    SELECT
        person_id AS id,
        order_date
    FROM person_order
) AS po
NATURAL JOIN person AS p
ORDER BY po.order_date ASC, person_information ASC;
