WITH cte_orders AS
    (SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
     FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     GROUP BY pizzeria.name),

    cte_visits AS
        (SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
         FROM person_visits
             JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
         GROUP BY pizzeria.name)

SELECT pizzeria.name,
       COALESCE(cte_visits.count, 0) + COALESCE(cte_orders.count, 0) AS total_count
FROM pizzeria
FULL JOIN cte_orders ON cte_orders.name = pizzeria.name
FULL JOIN cte_visits ON cte_visits.name = pizzeria.name
ORDER BY total_count DESC, name;
