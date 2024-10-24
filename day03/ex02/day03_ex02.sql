WITH cte_menu AS (
    SELECT *
    FROM menu
    WHERE NOT EXISTS(
        SELECT menu_id FROM person_order WHERE person_order.menu_id=menu.id
    )
)

SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM cte_menu
JOIN pizzeria ON cte_menu.pizzeria_id=pizzeria.id
ORDER BY pizza_name, price;
