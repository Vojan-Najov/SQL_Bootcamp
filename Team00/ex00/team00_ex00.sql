CREATE TABLE nodes (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INT NOT NULL
);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'b', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'c', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'd', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'a', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'c', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'd', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'a', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'b', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'd', 30);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'a', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'b', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'c', 30);

WITH RECURSIVE t (point1, point2, total_cost, is_cycle, tour) AS (
    (
        SELECT
            n.point1,
            n.point2,
            n.cost,
            false,
            ARRAY[n.point1, n.point2]::VARCHAR[]
        FROM nodes AS n
        WHERE n.point1 = 'a'
    )
    UNION DISTINCT
    (
        SELECT
            n.point1,
            n.point2,
            t.total_cost + n.cost,
            n.point2 = ANY(t.tour),
            t.tour || n.point2
        FROM nodes AS n, t
        WHERE n.point1 = t.point2 AND NOT t.is_cycle
    )
),

tours AS (
    SELECT
        t.total_cost,
        t.tour
    FROM t
    WHERE
        t.is_cycle
        AND CARDINALITY(t.tour) > 4
        AND t.tour[CARDINALITY(t.tour)] = 'a'
)

SELECT
    tours.total_cost,
    tours.tour
FROM tours
WHERE tours.total_cost = (SELECT MIN(tours.total_cost) FROM tours)
ORDER BY tours.total_cost ASC, tours.tour ASC;
