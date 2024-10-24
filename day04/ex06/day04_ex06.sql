CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person_visits.visit_date='2022-01-08' AND menu.price<800
ORDER BY pizzeria_name);
