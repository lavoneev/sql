WITH cte_table(missing_date) AS
    (SELECT days::DATE AS missing_date
     FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS days)
SELECT missing_date FROM cte_table
LEFT JOIN
    (SELECT person_id, visit_date
     FROM person_visits
     WHERE person_id='1' OR person_id='2') AS visits
ON visit_date=missing_date
WHERE person_id IS NULL
ORDER BY missing_date;
