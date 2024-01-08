(
    SELECT
        pizzeria.name,
        COUNT(pizzeria.name) AS count,
        'order' AS action_type
    FROM person_order AS po
    INNER JOIN menu
        ON po.menu_id = menu.id
    INNER JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
)
UNION ALL
(
    SELECT
        pizzeria.name,
        COUNT(pizzeria.name) AS count,
        'visit' AS action_type
    FROM person_visits AS pv
    INNER JOIN pizzeria
        ON pv.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY count DESC
    LIMIT 3
)
ORDER BY action_type ASC, count DESC;
