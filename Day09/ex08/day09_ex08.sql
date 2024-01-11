CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER AS $$
DECLARE
    fib1 INTEGER := 0;
    fib2 INTEGER := 1;
    tmp INTEGER;
BEGIN
    WHILE fib1 < pstop LOOP
        RETURN NEXT fib1;
        tmp := fib2;
	fib2 := fib2 + fib1;
	fib1 := tmp;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
