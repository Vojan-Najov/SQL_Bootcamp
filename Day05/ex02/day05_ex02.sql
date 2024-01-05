CREATE INDEX idx_person_name ON person (upper(name));

EXPLAIN ANALYZE
SELECT person.id AS person_id
FROM person
WHERE upper(person.name) = 'IRINA';
