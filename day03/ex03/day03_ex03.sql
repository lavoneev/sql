WITH cte_visits AS (
    SELECT person.gender, pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
)

(SELECT pizzeria_name
FROM cte_visits
WHERE gender='female'
EXCEPT ALL
SELECT pizzeria_name
FROM cte_visits
WHERE gender='male')

UNION ALL

(SELECT pizzeria_name
FROM cte_visits
WHERE gender='male'
EXCEPT ALL
SELECT pizzeria_name
FROM cte_visits
WHERE gender='female')
ORDER BY pizzeria_name;
