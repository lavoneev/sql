COMMENT ON TABLE person_discounts IS 'Таблица с персональными скидками, которые зависят от количества совершенных заказов';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный номер каждой строки в таблице';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный номер человека совершившего заказ';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный номер пиццерии, где был совершен заказ';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах';
