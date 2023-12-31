WITH visits AS (
    SELECT
        pizzeria.name AS pizzeria_name,
	person.gender AS gender
    FROM person_visits AS pv
    INNER JOIN pizzeria
        ON pv.pizzeria_id = pizzeria.id
    INNER JOIN person
        ON pv.person_id = person.id
),
visited_by_men AS (
    SELECT pizzeria_name
    FROM visits
    WHERE gender = 'male'
),
visited_by_women AS (
    SELECT pizzeria_name
    FROM visits
    WHERE gender = 'female'
)

(
    SELECT pizzeria_name FROM visited_by_women
    EXCEPT ALL
    SELECT pizzeria_name FROM visited_by_men
)
UNION ALL
(
    SELECT pizzeria_name FROM visited_by_men
    EXCEPT ALL
    SELECT pizzeria_name FROM visited_by_women
)
ORDER BY pizzeria_name ASC;
