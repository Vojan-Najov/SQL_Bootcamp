SELECT
    po.order_date,
    CONCAT(
        p.name,
        ' (age:',
        p.age,
        ')'
    ) AS person_information
FROM person_order AS po
INNER JOIN person AS p
    ON po.person_id = p.id
ORDER BY po.order_date ASC, person_information ASC
