SELECT days::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS days
LEFT JOIN
    (SELECT person_id, visit_date
     FROM person_visits
     WHERE person_id ='1' OR person_id='2') AS visits
ON visit_date=days
WHERE person_id is NULL
ORDER BY days;
