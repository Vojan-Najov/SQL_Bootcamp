SELECT
    person.address AS address,
    pizzeria.name AS name,
    COUNT(*) AS count_of_orders
FROM person_order AS po
INNER JOIN person
    ON po.person_id = person.id
INNER JOIN menu
    ON po.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY person.address ASC, pizzeria.name ASC;
