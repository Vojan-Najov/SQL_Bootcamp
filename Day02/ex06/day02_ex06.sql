SELECT
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order AS po
INNER JOIN menu
    ON po.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
INNER JOIN person
    ON po.person_id = person.id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY 1 ASC, 2 ASC;
