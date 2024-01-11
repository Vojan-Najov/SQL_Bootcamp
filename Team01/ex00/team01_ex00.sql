CREATE OR REPLACE FUNCTION last_rate(currency_name VARCHAR DEFAULT 'USD')
RETURNS NUMERIC AS $$
    SELECT rate_to_usd
    FROM currency
    WHERE name = currency_name
    ORDER BY updated DESC
    LIMIT 1;
$$ LANGUAGE sql;

WITH balance_aggregated AS (
    SELECT
        user_id,
        type,
        currency_id,
        sum(money) AS volume
    FROM balance
    GROUP BY user_id, type, currency_id
    ORDER BY user_id ASC, type ASC
),

currency_unique AS (
    SELECT DISTINCT
        id,
        name
    FROM currency
)

SELECT
    coalesce(u.name, 'not defined') AS name,
    coalesce(u.lastname, 'not defined') AS lastname,
    b.type AS type,
    b.volume AS volume,
    coalesce(c.name, 'not defined') AS currency_name,
    coalesce(last_rate(c.name), 1) AS last_rate_to_usd,
    b.volume * coalesce(last_rate(c.name), 1) AS total_volume_in_usd
FROM balance_aggregated AS b
LEFT OUTER JOIN "user" AS u
    ON b.user_id = u.id
LEFT JOIN currency_unique AS c
    ON b.currency_id = c.id
ORDER BY name DESC, lastname ASC, type ASC;
