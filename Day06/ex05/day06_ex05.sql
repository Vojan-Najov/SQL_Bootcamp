COMMENT ON TABLE person_discounts
IS 'THE table of discounts.';

COMMENT ON COLUMN person_discounts.id
IS 'THE unique attribute.';

COMMENT ON COLUMN person_discounts.person_id
IS 'The foreign key to the person table.';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'The foreign key to the pizzeria table.';

COMMENT ON COLUMN person_discounts.discount
IS 'The percentage of discount provided to the person in the pizzeria';

-- Show comments in psql:
-- \dt+                  (show comments of tables)
-- \d+ person_discounts  (show comment for table)
