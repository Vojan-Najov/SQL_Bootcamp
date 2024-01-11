CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria_name VARCHAR)
AS $$
    BEGIN
        RETURN QUERY
            SELECT pizzeria.name AS pizzeria_name
            FROM person_visits AS pv
            INNER JOIN pizzeria
                ON pv.pizzeria_id = pizzeria.id
            INNER JOIN person
                ON pv.person_id = person.id
            INNER JOIN menu
                ON pizzeria.id = menu.id
            WHERE
                person.name = pperson
                AND menu.price < pprice
                AND pv.visit_date = pdate;
    END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(
    pperson := 'Anna',
    pprice := 1300,
    pdate := '2022-01-01'
);
