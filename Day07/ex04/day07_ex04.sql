SELECT
    person.name AS name,
    COUNT(*) AS count_of_visits
FROM person_visits AS po
INNER JOIN person
    ON po.person_id = person.id
GROUP BY person.name
HAVING COUNT(*) > 3;
