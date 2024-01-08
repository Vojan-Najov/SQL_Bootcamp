SELECT
    person_id,
    COUNT(pizzeria_id) AS counts_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY counts_of_visits DESC, person_id ASC
