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
    WHERE pizza_name in ('pepperoni pizza', 'mushroom pizza')
)

SELECT
    person_temp.name
FROM person_order AS po
INNER JOIN person_temp
    ON po.person_id = person_temp.id
INNER JOIN menu_temp
    ON po.menu_id = menu_temp.id
ORDER BY person_temp.name DESC;
