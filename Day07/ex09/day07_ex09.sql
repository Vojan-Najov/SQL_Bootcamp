SELECT
    temp.address,
    temp.formula,
    temp.average,
    (temp.formula > temp.average)::TEXT AS comparison
FROM (
    SELECT
        address,
        ROUND(
            MAX(age)::NUMERIC - MIN(age)::NUMERIC / MAX(age)::NUMERIC, 2
        ) AS formula,
        ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
) AS temp
ORDER BY temp.address;
