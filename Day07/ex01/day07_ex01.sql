SELECT
    person.name AS name,
    COUNT(*) AS count_of_visits
FROM person_visits AS pv
INNER JOIN person
    ON pv.person_id = person.id
GROUP BY person.name
ORDER BY count_of_visits DESC, person.name ASC
LIMIT 4;
