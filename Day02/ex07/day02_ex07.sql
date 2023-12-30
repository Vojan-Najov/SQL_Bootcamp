WITH visited_pizzeria AS (
    SELECT
        pv.pizzeria_id AS id,
        pizzeria.name AS name
    FROM person_visits AS pv
    INNER JOIN person
        ON pv.person_id = person.id
    INNER JOIN pizzeria
        ON pv.pizzeria_id = pizzeria.id
    WHERE person.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
)

SELECT visited_pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN visited_pizzeria
    ON menu.pizzeria_id = visited_pizzeria.id
WHERE menu.price < 800;
