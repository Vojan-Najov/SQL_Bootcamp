SELECT
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    (menu.price * (1.0 - pd.discount / 100.0))::INTEGER AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order AS po
INNER JOIN person
    ON po.person_id = person.id
INNER JOIN menu
    ON po.menu_id = menu.id
INNER JOIN pizzeria
    ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_discounts AS pd
    ON person.id = pd.person_id AND pizzeria.id = pd.pizzeria_id
ORDER BY person.name ASC, menu.pizza_name ASC;

--(menu.price * (1.0 - pd.discount / 100.0))::NUMERIC(8,2) AS discount_price,
