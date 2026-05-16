SHOW timezone;
SELECT now();

CREATE TABLE timeZ(ts TIMESTAMP without time zone,tsz TIMESTAMP with time zone);

INSERT INTO timeZ VALUES('2026-05-15 07:27:00','2026-05-15 07:28:00');

SELECT * FROM timeZ;

SELECT now()::time;
SELECT now()::date;
SELECT to_char(now(),'yyyy/mm/dd');
SELECT CURRENT_DATE - INTERVAL '1 year 3 month';

SELECT extract(YEAR from '2024-04-02'::date);

--if anything similar with any type then i will be costing like type coausing;
SELECT 1::BOOLEAN;
