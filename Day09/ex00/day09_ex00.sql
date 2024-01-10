CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    type_event CHARACTER(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

ALTER TABLE person_audit
ADD CONSTRAINT ch_type_event
CHECK (type_event IN ('I', 'U', 'D'));

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
AS $person_insert_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
            VALUES (current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        END IF;
        
	RETURN NULL;
    END;
$person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person (id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
