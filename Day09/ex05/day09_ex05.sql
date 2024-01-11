DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id BIGINT, name VARCHAR, age VARCHAR, gender VARCHAR, address VARCHAR
)
AS $$
    SELECT
        id,
        name,
        age,
        gender,
        address
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
