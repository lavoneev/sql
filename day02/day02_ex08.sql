SELECT person.name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
WHERE person.gender='male' AND
      (person.address='Moscow' OR person.address='Samara') AND
      (menu.pizza_name='pepperoni pizza' OR menu.pizza_name='mushroom pizza')
ORDER BY person.name DESC;
