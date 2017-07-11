SELECT '[2, 9]'::int4range;

SELECT '(2, 9]'::int4range;

SELECT '[2017-07-15 09:00, 2017-07-15 14:00]'::tsrange;

SELECT int4range(10, 20) @> 3;

SELECT 10 <@ int4range(10, 20);

CREATE TABLE tb_reserva(
    sala int PRIMARY KEY,
    duracao tsrange);

INSERT INTO tb_reserva VALUES
    (1, '[2014-11-01 14:30, 2014-11-01 18:30)'),
    (2, '[2014-11-02 11:00, 2014-11-02 15:00)'),
    (3, '[2014-11-03 11:00, 2014-11-03 15:00)'),
    (4, '[2014-11-04 17:00, 2014-11-04 19:00)');

TABLE tb_reserva;

SELECT * FROM tb_reserva WHERE '2014-11-02 12:33'::timestamp <@ duracao;

SELECT * FROM tb_reserva WHERE duracao @> '2014-11-03 14:21'::timestamp;
