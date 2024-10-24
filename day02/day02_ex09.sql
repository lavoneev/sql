WITH cte_pepperoni(pepperoni) AS
    (SELECT person.name AS pepperoni
     FROM person_order
     JOIN person ON person_order.person_id = person.id
     JOIN menu ON person_order.menu_id = menu.id
     WHERE menu.pizza_name='pepperoni pizza' AND person.gender='female'
     ),

    cte_cheese(cheese) AS
    (SELECT person.name AS cheese
     FROM person_order
     JOIN person ON person_order.person_id = person.id
     JOIN menu ON person_order.menu_id = menu.id
     WHERE menu.pizza_name='cheese pizza' AND person.gender='female'
     )
SELECT name
FROM person
JOIN cte_pepperoni ON pepperoni=person.name
JOIN cte_cheese ON cheese=person.name;
