SELECT name, rating
FROM (SELECT name, person_id, rating
      FROM pizzeria
      LEFT JOIN person_visits
      ON pizzeria.id = pizzeria_id) AS pizza
WHERE (person_id IS NULL);
