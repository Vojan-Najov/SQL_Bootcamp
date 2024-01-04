CREATE INDEX idx_person_name ON person (upper(name));

SET enable_seqscan TO off;

EXPLAIN ANALYZE
SELECT upper(person.name) AS person_name
FROM person
ORDER BY person_name;
