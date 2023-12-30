WITH person_temp AS (
    SELECT
        id,
        name
    FROM person
    WHERE gender = 'male' AND address IN ('Moscow', 'Samara')
),

menu_temp AS (
    SELECT
        id,
        pizza_name
    FROM menu
    WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
)

SELECT pt.name
FROM person_order AS po
INNER JOIN person_temp AS pt
    ON po.person_id = pt.id
INNER JOIN menu_temp AS mt
    ON po.menu_id = mt.id
ORDER BY pt.name DESC;
