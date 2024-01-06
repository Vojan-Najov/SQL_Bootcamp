WITH orders AS (
    SELECT
        po.person_id AS person_id,
        menu.pizzeria_id AS pizzeria_id,
        COUNT(menu.pizzeria_id) AS order_count
    FROM person_order AS po
    INNER JOIN menu
        ON po.menu_id = menu.id
    GROUP BY po.person_id, menu.pizzeria_id
    ORDER BY po.person_id, menu.pizzeria_id
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount) (
    SELECT
        ROW_NUMBER() OVER () AS id,
        orders.person_id AS person_id,
        orders.pizzeria_id AS pizzeria_id,
        (
            CASE
                WHEN orders.order_count = 1 THEN 10.5
                WHEN orders.order_count = 2 THEN 22.0
                ELSE 30.0
            END
        ) AS discount
    FROM orders
)
