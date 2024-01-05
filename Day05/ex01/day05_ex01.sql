SET enable_seqscan TO off;

EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    p.name AS pizzeria_name
FROM menu AS m
INNER JOIN pizzeria AS p
    ON m.pizzeria_id = p.id;
