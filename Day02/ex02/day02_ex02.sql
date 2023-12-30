SELECT
    COALESCE(person.name, '-') AS person_name,
    pv.visit_date AS visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
    SELECT
        person_id,
        pizzeria_id,
        visit_date
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS pv
FULL OUTER JOIN person
    ON pv.person_id = person.id
FULL OUTER JOIN pizzeria
    ON pv.pizzeria_id = pizzeria.id
ORDER BY 1 ASC, 2 ASC, 3 ASC;
