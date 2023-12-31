WITH orders AS (
    SELECT
        pizzeria.name AS pizzeria_name,
	person.gender AS gender
    FROM person_order AS po
    INNER JOIN menu
        ON po.menu_id = menu.id
    INNER JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id
    INNER JOIN person
        ON po.person_id = person.id
),
ordered_by_men AS (
    SELECT pizzeria_name
    FROM orders
    WHERE gender = 'male'
),
ordered_by_women AS (
    SELECT pizzeria_name
    FROM orders
    WHERE gender = 'female'
)

(
    SELECT pizzeria_name FROM ordered_by_women
    EXCEPT
    SELECT pizzeria_name FROM ordered_by_men
)
UNION DISTINCT
(
    SELECT pizzeria_name FROM ordered_by_men
    EXCEPT
    SELECT pizzeria_name FROM ordered_by_women
)
ORDER BY pizzeria_name ASC;
