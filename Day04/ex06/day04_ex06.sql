CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits AS pv
INNER JOIN person
    ON pv.person_id = person.id
INNER JOIN pizzeria
    ON pv.pizzeria_id = pizzeria.id
INNER JOIN menu
    ON pizzeria.id = menu.pizzeria_id
WHERE
    person.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND menu.price < 800
ORDER BY pizzeria_name ASC;
