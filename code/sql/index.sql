SELECT
    generate_series(1, 20000)::int2 AS campo1, -- 20 mil registros
    round((random()*10000))::int2 AS campo2,
    round((random()*10000))::int2 AS campo3 INTO tb_index;

EXPLAIN ANALYZE
SELECT campo1 FROM tb_index WHERE campo2 BETWEEN 235 AND 587;

CREATE INDEX idx_tb_index_campo2 ON tb_index (campo2);

EXPLAIN ANALYZE
SELECT campo1 FROM tb_index WHERE campo2 BETWEEN 235 AND 587;

CREATE INDEX idx_tb_index_campo2_campo3 ON tb_index (campo2, campo3);

EXPLAIN ANALYZE
SELECT campo1 FROM tb_index
    WHERE (campo2 BETWEEN 235 AND 587) AND campo3 = 1000;

DROP TABLE tb_index;

CREATE TABLE tb_index(campo1 int);

INSERT INTO tb_index SELECT generate_series(1, 1000000);

EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;

CREATE INDEX idx_teste_index_total ON tb_index (campo1);

EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;

CREATE INDEX idx_teste_index_19 ON tb_index (campo1) WHERE campo1 % 19 = 0;

EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;

EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 BETWEEN 241 AND 875;
