INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
    (SELECT row_number() over () AS id,
            person_order.person_id,
            pizzeria.id,
            (
                CASE
                    WHEN COUNT(person_order.person_id) = 1 THEN 10.5
                    WHEN COUNT(person_order.person_id) = 2 THEN 22
                    ELSE 30
                END
                )
     FROM person_order
     JOIN menu ON person_order.menu_id = menu.id
     JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
     GROUP BY person_order.person_id, pizzeria.id
     ORDER BY person_id
     );
