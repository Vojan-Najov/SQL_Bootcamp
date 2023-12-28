SELECT
    (
        SELECT p.name
        FROM person AS p
        WHERE p.id = po.person_id
    ) AS person_name,
    m.pizza_name AS pizza_name,
    (
        SELECT p.name
        FROM pizzeria AS p
        WHERE p.id = m.pizzeria_id
    ) AS pizzeria_name
FROM person_order AS po
INNER JOIN menu AS m
    ON po.menu_id = m.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;

/*
WITH pizza AS (
    SELECT
        menu.id,
        menu.pizza_name,
        pizzeria.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
)

SELECT
    person.name AS person_name,
    pizza.pizza_name AS pizza_name,
    pizza.pizzeria_name AS pizzeria_name
FROM person_order
INNER JOIN pizza
    ON person_order.menu_id = pizza.id
INNER JOIN person
    ON person_order.person_id = person.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;
*/
