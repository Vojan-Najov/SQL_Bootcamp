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
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC
