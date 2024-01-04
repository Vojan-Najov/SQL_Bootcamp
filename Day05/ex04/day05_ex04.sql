CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan TO off;

EXPLAIN ANALYZE
SELECT
    pizza_name,
    price
FROM menu
WHERE pizzeria_id = 3
ORDER BY pizza_name ASC;
