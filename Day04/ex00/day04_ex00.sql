CREATE VIEW v_persons_female AS
SELECT
    person.id AS id,
    person.name AS name,
    person.age AS age,
    person.gender AS gender,
    person.address AS address
FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT
    person.id AS id,
    person.name AS name,
    person.age AS age,
    person.gender AS gender,
    person.address AS address
FROM person
WHERE gender = 'male';
