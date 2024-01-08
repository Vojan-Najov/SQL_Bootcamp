WITH visits_and_orders AS (
    (
        SELECT pizzeria.name AS name
        FROM person_order AS po
        INNER JOIN menu
            ON po.menu_id = menu.id
        INNER JOIN pizzeria
            ON menu.pizzeria_id = pizzeria.id
    )
    UNION ALL
    (
        SELECT pizzeria.name AS name
        FROM person_visits AS pv
        INNER JOIN pizzeria
            ON pv.pizzeria_id = pizzeria.id
    )
)

SELECT
    vo.name AS name,
    COUNT(*) AS total_count
FROM visits_and_orders AS vo
GROUP BY vo.name
ORDER BY total_count DESC, name ASC;
