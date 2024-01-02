WITH pizzeria_temp AS (
    SELECT DISTINCT pizzeria.id AS id
    FROM pizzeria
    INNER JOIN menu
        ON pizzeria.id = menu.pizzeria_id
    LEFT OUTER JOIN mv_dmitriy_visits_and_eats AS mvd
        ON pizzeria.name = mvd.pizzeria_name
    WHERE menu.price < 800 AND mvd.pizzeria_name IS NULL
)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT max(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT id FROM pizzeria_temp LIMIT 1),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
