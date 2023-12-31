WITH new_menu AS (
    SELECT
        menu.pizzeria_id AS pizzeria_id,
        menu.pizza_name AS pizza_name,
        menu.price AS price,
        pizzeria.name AS pizzeria_name
    FROM menu
    INNER JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
)

SELECT
    m1.pizza_name AS pizza_name,
    m1.pizzeria_name AS pizzeria_name_1,
    m2.pizzeria_name AS pizzeria_name_2,
    m1.price AS price
FROM new_menu AS m1, new_menu AS m2
WHERE
    m1.pizza_name = m2.pizza_name
    AND m1.pizzeria_name < m2.pizzeria_name
    AND m1.price = m2.price
ORDER BY pizza_name;
