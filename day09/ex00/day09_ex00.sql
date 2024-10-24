CREATE TABLE person_audit (
    created timestamp with time zone default CURRENT_TIMESTAMP NOT NULL,
    type_event char(1) default 'I' constraint ch_type_event check ( type_event IN ('I', 'D', 'U')) NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $person_insert_audit$
    BEGIN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NEW;
    END;
$person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
