INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    generate_series(
        (SELECT max(id) FROM person_order) + 1,
        (SELECT max(id) FROM person_order) + (SELECT max(id) FROM person),
        1
    ) AS id,
    generate_series(
        (SELECT min(id) FROM person),
        (SELECT max(id) FROM person),
        1
    ) AS person_id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date;
