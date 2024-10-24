WITH cte_visits AS (
    SELECT person.gender, pizzeria.name AS pizzeria_name
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person_order.person_id = person.id
)

(SELECT pizzeria_name
FROM cte_visits
WHERE gender='female'
EXCEPT
SELECT pizzeria_name
FROM cte_visits
WHERE gender='male')

UNION

(SELECT pizzeria_name
FROM cte_visits
WHERE gender='male'
EXCEPT
SELECT pizzeria_name
FROM cte_visits
WHERE gender='female')
ORDER BY pizzeria_name;
