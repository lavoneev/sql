SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE("user".lastname, 'not defined') AS lastname,
       t1.type AS type,
       t1.volume AS volume,
       COALESCE(t2.name, 'not defined') AS currency_name,
       COALESCE(
               (SELECT rate_to_usd
                FROM currency
                WHERE currency.id = t2.id
                  AND currency.updated = t2.max_updated),
               1) AS last_rate_to_usd,
       COALESCE(
               (SELECT rate_to_usd
                FROM currency
                WHERE currency.id = t2.id
                  AND currency.updated = t2.max_updated),
               1) * t1.volume AS total_volume_in_usd
FROM "user"
         FULL JOIN (SELECT user_id, type, currency_id, SUM(money) AS volume FROM balance GROUP BY user_id, type, currency_id) AS t1 ON "user".id = t1.user_id
         FULL JOIN (SELECT id, name, MAX(updated) AS max_updated FROM currency GROUP BY id, name) AS t2 ON t2.id = t1.currency_id
ORDER BY 1 DESC, 2, 3;
