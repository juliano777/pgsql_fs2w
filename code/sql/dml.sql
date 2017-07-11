CREATE TABLE tb_teste(
    id serial PRIMARY KEY,
    campo1 varchar(10),
    campo2 int);

INSERT INTO tb_teste (campo1, campo2) VALUES ('foo', 25);

SELECT currval('tb_teste_id_seq');

INSERT INTO tb_teste VALUES (2, 'bar', (random() * 100)::int);

INSERT INTO tb_teste (campo1, campo2) VALUES
    ('spam', 58),
    ('eggs', 87),
    ('foobar', 92),
    ('spameggs', 43),
    ('eggsspam', 99);

SELECT currval('tb_teste_id_seq');

INSERT INTO tb_teste (campo1, campo2)
    SELECT 'string', 77;

TABLE tb_teste;

SELECT * FROM tb_teste;

SELECT id, campo2, campo1 FROM tb_teste WHERE id >= 5;

BEGIN;

UPDATE tb_teste SET campo2 = 100;

ROLLBACK;

UPDATE tb_teste SET campo2 = 100 WHERE id = 2;

UPDATE tb_teste SET (campo1, campo2) = (NULL, 404)
    WHERE id BETWEEN 5 AND 9
    RETURNING campo1, campo2;

DELETE FROM tb_teste WHERE campo1 IS NULL;

DELETE FROM tb_teste WHERE id = 4 RETURNING campo1, campo2;

DROP TABLE tb_teste;

CREATE TABLE tb_teste AS SELECT generate_series(1, 2000000);

DELETE FROM tb_teste;

DROP TABLE tb_teste;

CREATE TABLE tb_teste AS SELECT generate_series(1, 2000000);

TRUNCATE tb_teste;

INSERT INTO tb_teste SELECT generate_series(1, 20);

SELECT * FROM tb_teste LIMIT 5;

SELECT generate_series FROM tb_teste ORDER BY generate_series DESC LIMIT 5;

SELECT generate_series FROM tb_teste OFFSET 15;

SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 0;

SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 5;

SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 10;
