CREATE TEMP TABLE tb_carro(
    id serial PRIMARY KEY,
    nome VARCHAR(20));

CREATE TEMP TABLE tb_cor(
    id serial PRIMARY KEY,
    nome VARCHAR(20));

INSERT INTO tb_carro (nome) VALUES
    ('Fiat 147'),
    ('VW Fusca'),
    ('Ford Corcel'),
    ('GM Opala');

INSERT INTO tb_cor (nome) VALUES
    ('Verde'),
    ('Azul'),
    ('Amarelo'),
    ('Branco'),
    ('Preto'),
    ('Vermelho'),
    ('Laranja'),
    ('Cinza');

SELECT c1.nome carro, c2.nome cor
    FROM tb_carro c1, tb_cor c2
    LIMIT 5;

SELECT c1.nome carro, c2.nome cor
    FROM tb_carro c1
    CROSS JOIN
    tb_cor c2
    LIMIT 5;

SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    NATURAL JOIN tb_pf p
    WHERE c.salario >= 5000;

SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    INNER JOIN tb_pf p
    ON c.cpf = p.cpf
    WHERE c.salario >= 5000;

SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    INNER JOIN tb_pf p
    USING (cpf)
    WHERE c.salario >= 5000;

INSERT INTO tb_pf VALUES
    ('Elzinda', '1979-05-03', NULL, '10293847567', '2233551177', 'Ambrózio',
     'f'),
    ('Carmelita', '1915-01-01', NULL, '00000000011', '0000000011', 'Antunes',
     'f'),
    ('Sizorfino', '1978-11-26', NULL, '00000000111', '0000000111', 'Chagas',
     'm');

SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_pf p
    LEFT OUTER JOIN tb_colaborador c
        USING (cpf)
    OFFSET 35;

SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_colaborador c
    RIGHT OUTER JOIN tb_pf p USING (cpf)
    OFFSET 35;

SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_pf p
    FULL OUTER JOIN tb_colaborador c USING (cpf)
    OFFSET 35;

SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_colaborador c
    FULL OUTER JOIN tb_pf p USING (cpf)
    OFFSET 35;
