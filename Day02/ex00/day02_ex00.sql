SELECT p.name
FROM pizzeria AS p
LEFT OUTER JOIN person_visits AS pv
    ON p.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;

/*
SELECT p.name
FROM person_visits AS pv
RIGHT OUTER JOIN pizzeria AS p
    ON pv.pizzeria_id = p.id
WHERE pv.pizzeria_id IS NULL;
*/
