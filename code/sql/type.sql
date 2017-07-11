SELECT pg_typeof(7);

SELECT pg_typeof(7::int2);

SELECT pg_typeof(7::int8);

SELECT pg_typeof('foo');

SELECT pg_typeof('foo'::varchar);

SELECT pg_typeof('foo'::text);

SELECT '192.168.0.1'::inet;

SELECT '192.168.0.256'::inet;

SELECT '00:01:07:f4:cb:55'::macaddr;

SELECT '192.168/25'::cidr;

SELECT 'fe80::f67e:5b4f:d208:713a/64'::inet;

SELECT pg_column_size('fe80::f67e:5b4f:d208:713a/64'::text);

SELECT pg_column_size('fe80::f67e:5b4f:d208:713a/64'::inet);

SELECT to_char(39684721495, '999"."999"."999-99') AS cpf;

SELECT to_char(2017, 'RN');

SELECT 10500::numeric(7, 2);
