SELECT DISTINCT person.name
FROM person_order AS po
INNER JOIN person
    ON po.person_id = person.id
ORDER BY person.name ASC;
