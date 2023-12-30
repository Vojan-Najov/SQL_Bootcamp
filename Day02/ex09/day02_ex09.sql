(
    SELECT person.name AS name
    FROM person_order AS po
    INNER JOIN person
        ON po.person_id = person.id
    INNER JOIN menu
        ON po.menu_id = menu.id
    WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
)
INTERSECT
(
    SELECT person.name AS name
    FROM person_order AS po
    INNER JOIN person
        ON po.person_id = person.id
    INNER JOIN menu
        ON po.menu_id = menu.id
    WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'
)
ORDER BY name ASC;
