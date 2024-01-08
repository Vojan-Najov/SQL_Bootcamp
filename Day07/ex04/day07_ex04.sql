SELECT
    person.name AS name,
    COUNT(person.name) AS count_of_visits
FROM person_visits AS po
INNER JOIN person
    ON po.person_id = person.id
GROUP BY person.name
HAVING COUNT(person.name) > 3;
