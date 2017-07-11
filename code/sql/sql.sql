SELECT 'Um exemplo de string';

SELECT 'Um exemplo de string' AS apelido;

SELECT 'Um exemplo de string' AS "apelido com espaço";

SELECT 5 + 2;

SELECT 5 + 2 AS resultado;

SELECT 'Hoje é ' || now()::date AS "Concatenação e cast para date";

SELECT 'Agora são ' || now()::time(0) AS "Concatenação e cast para time";
