-- SESSION №1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SESSION №2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- SESSION №1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

-- SESSION №2
UPDATE pizzeria SET rating=3.0 WHERE name='Pizza Hut';
-- SESSION №2
COMMIT;

-- SESSION №1
SELECT * FROM pizzeria WHERE name='Pizza Hut';
-- SESSION №1
COMMIT;
-- SESSION №1
SELECT * FROM pizzeria WHERE name='Pizza Hut';

-- SESSION №2
SELECT * FROM pizzeria WHERE name='Pizza Hut';
