SELECT
    COALESCE(person.name, '-') AS person_name,
    visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM
    (SELECT visit_date, person_id, pizzeria_id
     FROM person_visits
     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS visits
FULL JOIN person ON person_id=person.id
FULL JOIN pizzeria ON pizzeria_id=pizzeria.id
ORDER BY person_name, visit_date, pizzeria_name;
