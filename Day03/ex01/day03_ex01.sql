SELECT menu.id AS menu_id
FROM menu
LEFT OUTER JOIN person_order AS po
    ON menu.id = po.menu_id
WHERE po.menu_id IS NULL
ORDER BY menu.id ASC;

/*
SELECT menu.id AS menu_id
FROM person_order AS po
RIGHT OUTER JOIN menu
    ON po.menu_id = menu.id
WHERE po.id IS NULL
ORDER BY menu.id ASC;
*/
