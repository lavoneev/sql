SELECT person.address,
    ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
    ROUND(AVG(age::numeric), 2) AS average,
    (SELECT
         CASE
             WHEN (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > AVG(age::numeric)
                 THEN True
             ELSE False
             END
     ) AS comparison
FROM person
GROUP BY person.address
ORDER BY person.address;
