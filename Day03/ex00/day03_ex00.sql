SELECT
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name,
    pv.visit_date AS visit_date
FROM person_visits AS pv
INNER JOIN menu
    ON pv.pizzeria_id = menu.pizzeria_id
INNER JOIN person
    ON pv.person_id = person.id
INNER JOIN pizzeria
    ON pv.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY menu.pizza_name ASC, menu.price ASC, pizzeria.name ASC;
