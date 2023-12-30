SELECT
    minimenu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name,
    minimenu.price AS price
FROM (
    SELECT
        pizzeria_id,
        pizza_name,
        price
    FROM menu
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
) AS minimenu
INNER JOIN pizzeria
    ON minimenu.pizzeria_id = pizzeria.id
ORDER BY minimenu.pizza_name ASC, pizzeria.name ASC;
