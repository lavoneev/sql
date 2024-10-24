
CREATE TABLE IF NOT EXISTS nodes (
	point1 varchar,
	point2 varchar, 
	cost int 
);
INSERT INTO nodes ( point1, point2, cost)
VALUES ( 'a', 'b', 10),
	( 'a', 'c', 15),
	( 'a', 'd', 20),
	( 'b', 'c', 35),
	( 'b', 'd', 25),
	( 'c', 'd', 30);
 INSERT INTO nodes ( point1, point2, cost)
 VALUES (  'b', 'a', 10),
 	(  'c','a',15),
 	(  'd','a', 20),
 	(  'c','b', 35),
 	(  'd','b', 25),
 	(  'd','c', 30);

WITH RECURSIVE travel AS (SELECT point1 AS path,
                                 point1,
                                 0      AS sum,
                                 1      AS level
                          FROM nodes
                          WHERE point1 = 'a'
                          UNION ALL
                          SELECT travel.path || ',' || nodes.point2,
                                 nodes.point2,
                                 travel.sum + nodes.cost,
                                 travel.level + 1
                          FROM nodes
                                   JOIN travel ON travel.point1 = nodes.point1
                          WHERE travel.path NOT LIKE '%' || nodes.point2 || '%'),
    ways AS (SELECT travel.sum + nodes.cost           AS total_cost,
                     '{' || travel.path || ',a' || '}' AS tour
              FROM travel
                       JOIN nodes ON nodes.point1 = travel.point1 AND nodes.point2 = 'a'
              WHERE travel.level = 4)
SELECT DISTINCT *
FROM ways
ORDER BY total_cost, tour;