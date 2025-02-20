CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan to OFF;

EXPLAIN (ANALYZE)
SELECT pizzeria_id, pizza_name
FROM menu;
