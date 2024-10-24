CREATE FUNCTION fnc_persons_female() RETURNS SETOF person AS $female$
SELECT * FROM person
WHERE gender='female';
$female$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_female();

CREATE FUNCTION fnc_persons_male() RETURNS SETOF person AS $male$
SELECT * FROM person
WHERE gender='male';
$male$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();
