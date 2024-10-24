SELECT order_date,
       (SELECT
            CONCAT(pina.name, ' ', '(', 'age:', pina.age, ')')
        )AS person_information
FROM person_order
NATURAL JOIN
    (SELECT id AS person_id, name, age FROM person) AS pina
ORDER BY order_date, person_information;
