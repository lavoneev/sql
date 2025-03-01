SELECT
    (SELECT name FROM person WHERE id = person_order.person_id) AS person_name,
    (SELECT pizza_name FROM menu WHERE id = person_order.menu_id) AS pizza_name,
    (SELECT name FROM pizzeria WHERE id = men.pizzeria_id) AS pizzeria_name
FROM person_order
JOIN menu men ON person_order.menu_id = men.id
JOIN person ON person.id = person_order.person_id
ORDER BY person_name, pizza_name, pizzeria_name;
