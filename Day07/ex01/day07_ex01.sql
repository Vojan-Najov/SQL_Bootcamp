SELECT
    person.name AS name,
    COUNT(person.name) AS counts_of_visits
FROM person_visits AS pv
INNER JOIN person
    ON pv.person_id = person.id
GROUP BY person.name
ORDER BY counts_of_visits DESC, person.name ASC
LIMIT 4;
