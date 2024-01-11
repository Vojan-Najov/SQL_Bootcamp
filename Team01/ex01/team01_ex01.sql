INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');

INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION calc_currency_before_ts(
    currency_name VARCHAR DEFAULT 'USD',
    balance_updated TIMESTAMP DEFAULT current_timestamp
)
RETURNS NUMERIC AS $$
    SELECT rate_to_usd
    FROM currency
    WHERE
        name = currency_name
        AND updated < balance_updated
    ORDER BY updated DESC
    LIMIT 1
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION calc_currency_after_ts(
    currency_name VARCHAR DEFAULT 'USD',
    balance_updated TIMESTAMP DEFAULT current_timestamp
)
RETURNS NUMERIC AS $$
    SELECT rate_to_usd
    FROM currency
    WHERE
        name = currency_name
        AND updated > balance_updated
    ORDER BY updated ASC
    LIMIT 1
$$ LANGUAGE sql;

WITH currency_unique AS (
    SELECT DISTINCT
        id,
        name
    FROM currency
)

SELECT
    coalesce(u.name, 'not defined') AS name,
    coalesce(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    b.money
    * coalesce(
        calc_currency_before_ts(c.name, b.updated),
        calc_currency_after_ts(c.name, b.updated)
    ) AS currency_in_usd
FROM balance AS b
LEFT OUTER JOIN "user" AS u
    ON b.user_id = u.id
INNER JOIN currency_unique AS c
    ON b.currency_id = c.id
ORDER BY name DESC, lastname ASC, currency_name ASC;
