CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) RETURNS TABLE (num INTEGER) AS $$
DECLARE
n1 integer;
n2 integer;
BEGIN
    n1:=0;
    n2:=1;
    num:=0;
    RETURN NEXT;
    num:=1;
    RETURN NEXT;
    WHILE n1+n2<pstop LOOP
        num:=n1+n2;
        n1:=n2;
        n2:=num;
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci();
select * from fnc_fibonacci(100);
