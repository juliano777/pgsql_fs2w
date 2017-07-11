SELECT c1.cpf
    FROM tb_colaborador c1
    WHERE c1.salario > (SELECT (avg(c2.salario) * 1.9)
                     FROM tb_colaborador c2);

SELECT c1.cpf "CPF", c1.salario -
    (SELECT avg(c2.salario) FROM tb_colaborador c2)::numeric(7, 2)
    "Diferença da Média"
    FROM tb_colaborador c1
    LIMIT 5;

SELECT c.id
    FROM tb_colaborador c
    WHERE c.cpf NOT IN
        (SELECT p.cpf
            FROM tb_pf p
            WHERE p.dt_Nascto
                BETWEEN '1982-01-01' AND '1983-12-31') AND setor = 3;
