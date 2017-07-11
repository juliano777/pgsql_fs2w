CREATE DOMAIN dom_cep AS integer
    CONSTRAINT chk_cep
        CHECK (length(VALUE::text) = 7
        OR length(VALUE::text) = 8);

CREATE TEMP TABLE tb_endereco_tmp(
    id serial PRIMARY KEY,
    cep dom_cep,
    logradouro text,
    numero smallint,
    cidade varchar(50),
    uf char(2));

INSERT INTO tb_endereco_tmp (cep, logradouro, numero, cidade, uf) VALUES
    (1001000, 'Pça. da Sé', null,'São Paulo','SP'),
    (30130003, 'Av. Afonso Pena', 1212, 'Belo Horizonte', 'MG');

SELECT
    to_char(cep, '00000-000') "CEP",
    logradouro "Logradouro",
    numero "Número",
    cidade "Cidade",
    uf "Estado"
    FROM tb_endereco_tmp;
