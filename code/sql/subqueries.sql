SELECT c1.cpf
    FROM tb_colaborador c1
    WHERE c1.salario > (SELECT (avg(c2.salario) * 1.9)
                     FROM tb_colaborador c2);


