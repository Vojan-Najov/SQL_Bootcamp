CREATE VIEW v_price_with_discount AS
SELECT
    person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    CAST(menu.price - 0.1 * menu.price AS INTEGER) AS discount_price
FROM person_order AS po
INNER JOIN person
    ON po.person_id = person.id
INNER JOIN menu
    ON po.menu_id = menu.id;
