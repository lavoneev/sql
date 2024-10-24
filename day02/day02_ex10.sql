SELECT first_name.name AS person_name1,
       second_name.name AS person_name2,
       first_name.address AS common_address
FROM person AS first_name
CROSS JOIN person AS second_name
WHERE first_name.name != second_name.name AND
      first_name.address = second_name.address AND
      first_name.id > second_name.id
ORDER BY person_name1, person_name2, common_address;
