(
SELECT
    pizzeria.name AS pizzeria_name
FROM person_visits AS pv
INNER JOIN pizzeria
    ON pv.pizzeria_id = pizzeria.id
INNER JOIN person
    ON pv.person_id = person.id
WHERE person.name = 'Andrey'
)
EXCEPT DISTINCT
(
SELECT
    pizzeria.name AS pizzeria_name
FROM person_order AS po
INNER JOIN menu
    ON po.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
INNER JOIN person
    ON po.person_id = person.id
WHERE person.name = 'Andrey'
)
ORDER BY pizzeria_name;
