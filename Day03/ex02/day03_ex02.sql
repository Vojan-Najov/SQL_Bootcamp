WITH not_ordered AS (
    SELECT
        menu.pizza_name AS pizza_name,
        menu.price AS price,
        menu.pizzeria_id AS pizzeria_id
    FROM menu
    LEFT OUTER JOIN person_order AS po
        ON menu.id = po.menu_id
    WHERE po.menu_id IS NULL
    ORDER BY menu.id ASC
)

SELECT
    not_ordered.pizza_name AS pizza_name,
    not_ordered.price AS price,
    pizzeria.name AS pizzeria_name
FROM not_ordered
INNER JOIN pizzeria
    ON not_ordered.pizzeria_id = pizzeria.id
ORDER BY not_ordered.pizza_name ASC, not_ordered.price ASC;
