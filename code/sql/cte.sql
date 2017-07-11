WITH c2 AS (SELECT (avg(salario) * 1.9) AS media FROM tb_colaborador)
    SELECT c1.cpf
        FROM tb_colaborador c1, c2
        WHERE c1.salario > c2.media;

WITH c2 AS (SELECT avg(salario)::numeric(7, 2) media
            FROM tb_colaborador)
    SELECT c1.cpf "CPF", c1.salario - c2.media "Diferença da Média"
        FROM tb_colaborador c1, c2
        LIMIT 5;
