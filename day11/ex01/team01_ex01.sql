insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');



SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE("user".lastname, 'not defined') AS lastname,
       currency.name AS currency_name,
       balance.money*COALESCE((SELECT rate_to_usd FROM currency
                               WHERE currency.id=balance.currency_id AND currency.updated<balance.updated
                               ORDER BY currency.updated DESC LIMIT 1),
	(SELECT rate_to_usd FROM currency
	WHERE currency.id=balance.currency_id AND currency.updated>balance.updated
	ORDER BY currency.updated ASC LIMIT 1)) AS currency_in_usd
FROM balance
         LEFT JOIN "user" ON balance.user_id="user".id
         INNER JOIN (SELECT id, name FROM currency GROUP BY id, name) AS currency ON balance.currency_id=currency.id

ORDER BY 1 DESC, 2, 3;