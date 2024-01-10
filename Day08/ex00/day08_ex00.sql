-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Sesion #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

-- Sesion #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
