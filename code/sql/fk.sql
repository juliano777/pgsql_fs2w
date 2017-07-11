CREATE TEMP TABLE tb_uf(
    id char(2) PRIMARY KEY,
    nome VARCHAR(30));

CREATE TEMP TABLE tb_cidade(
    id serial PRIMARY KEY,
    nome VARCHAR(40),
    uf char(2) REFERENCES tb_uf (id));

DROP TABLE tb_uf;

COPY tb_uf (id, nome) FROM STDIN DELIMITER ',';

MG,MINAS GERAIS
SP,SÃO PAULO
RR,RORAIMA
AC,ACRE
AL,ALAGOAS
AP,AMAPÁ
AM,AMAZONAS
BA,BAHIA
CE,CEARÁ
DF,DISTRITO FEDERAL
ES,ESPÍRITO SANTO
GO,GOIÁS
MA,MARANHÃO
MT,MATO GROSSO
MS,MATO GROSSO DO SUL
PA,PARÁ
PR,PARANÁ
PE,PERNAMBUCO
PI,PIAUÍ
RJ,RIO DE JANEIRO
RN,RIO GRANDE DO NORTE
RS,RIO GRANDE DO SUL
RO,RONDÔNIA
SC,SANTA CATARINA
SE,SERGIPE
TO,TOCANTINS
PB,PARAIBA

INSERT INTO tb_cidade (nome, uf) VALUES
    ('São Paulo', 'SP'),
    ('Belo Horizonte', 'MG'),
    ('Vitória', 'ES'),
    ('Rio de Janeiro', 'RJ');

INSERT INTO tb_cidade (nome, uf) VALUES
    ('foo', 'NN'),
    ('bar', 'NN');

INSERT INTO tb_uf (id, nome) VALUES ('NN', '...');

INSERT INTO tb_cidade (nome, uf) VALUES
    ('foo', 'NN'),
    ('bar', 'NN');

DELETE FROM tb_uf WHERE id = 'NN';

DELETE FROM tb_cidade WHERE uf = 'NN';

DELETE FROM tb_uf WHERE id = 'NN';

DROP TABLE tb_uf CASCADE;
