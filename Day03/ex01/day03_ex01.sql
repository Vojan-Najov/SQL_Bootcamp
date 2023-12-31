SELECT menu.id AS menu_id
FROM person_order AS po
RIGHT OUTER JOIN menu
    ON po.menu_id = menu.id
WHERE po.id IS NULL
ORDER BY menu.id ASC;
