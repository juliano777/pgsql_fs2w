CREATE DATABASE db_workshop;

SELECT current_database();

SELECT current_user;

CREATE TABLE tb_produto(
    id serial PRIMARY KEY,
    nome varchar(50) NOT NULL,
    preco numeric(7, 2) NOT NULL,
    descricao text);

ALTER TABLE tb_produto ADD COLUMN campo_inteiro INT;

ALTER TABLE tb_produto RENAME TO tb_prod;

CREATE TABLE tb_foo (campo INT);

CREATE SCHEMA sc_teste;

SELECT nspname AS schema FROM pg_namespace;

CREATE TABLE tb_foo (campo INT);

CREATE TABLE sc_teste.tb_foo(
    campo1 INT,
    campo2 INT);

SELECT tablename AS tabela, schemaname AS schema
    FROM pg_tables
    WHERE schemaname !~ 'information_schema|pg_.*';

CREATE VIEW vw_tabelas AS
    SELECT tablename AS tabela, schemaname AS schema
    FROM pg_tables
    WHERE schemaname !~ 'information_schema|pg_.*';

SELECT schema || '.' || tabela AS "Tabela com namespace" FROM vw_tabelas;

DROP TABLE public.tb_prod, public.tb_foo, sc_teste.tb_foo;

DROP VIEW vw_tabelas;

DROP SCHEMA sc_teste;
