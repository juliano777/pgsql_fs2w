---
<h1>Workshop</h1>
<img src="img/pg.png" alt="PostgreSQL logo" />

---
 * [**Preparação do Ambiente**](#preparacao)
 * [**Sobre o PostgreSQL**](#pg)
 * [**SQL**](#sql)
 * [**Tipos de Dados**](#types)
 * [**DDL**](#ddl)
 * [**DML**](#dml)
 * [**Chave Estrangeira**](#fk)
 * [**Subqueries**](#subqueries)
 * [**CTE**](#cte)
 * [**Junções**](#juncoes)
 * [**Indexação**](#index)
 * [**Range Types**](#range)
 * [**DOMAIN**](#domain)
 * [**Acessando o Postgres via Python (psycopg2)**](#python)
 * [**PL/Python: Programando em Python no PostgreSQL**](#plpython)
---

<a id="preparacao"></a>
## Preparação do Ambiente

### Baixar / Instalar

* [Imagem (arquivo .ova) VirtualBox](https://drive.google.com/open?id=0BxpIiayGYAzoelY1MTd2RXdINU0)
* [VirtualBox](https://www.virtualbox.org/)

#### VirtualBox

* Criar Interface de Rede Host-Only:

File &rarr; Preferences &rarr; Network &rarr; Host-only Networks &rarr; + &rarr; OK

* Importar a Imagem Appliance:

File &rarr; Import Appliance... &rarr; (localize o arquivo .ova) &rarr; Next &rarr; Import



---
<a id="pg"></a><p />
## Sobre o PostgreSQL


to do... ;)


---
<a id="sql"></a><p />
## SQL

**Structured Query Language** – **Linguagem Estruturada de Consulta**, é a linguagem usada nos SGBDs relacionais por padrão, no entanto cada um tem suas particularidades dentro da própria linguagem, tendo implementações diferentes.
<br />O mesmo objetivo pode ser feito de formas SQL diferentes de um SGBD pra outro.
<br />Assim como em linguagens de programação “comuns”, existem palavras reservadas, as quais não podem ser usadas como identificadores.
<br />Cada comando SQL é finalizado com ponto e vírgula (;).<p />




1)  **Um SELECT simples retornando uma string:**
```sql
SELECT 'Um exemplo de string';
```
<pre>
       ?column?       
----------------------
 Um exemplo de string
 </pre>


2)  **Um SELECT simples com alias retornando uma string:**
```sql
SELECT 'Um exemplo de string' AS apelido;
```
<pre>
       apelido        
----------------------
 Um exemplo de string
 </pre>


 3)  **Um SELECT simples com alias contendo espaços retornando uma string:**
```sql
SELECT 'Um exemplo de string' AS "apelido com espaço";
```
<pre>
  apelido com espaço  
----------------------
 Um exemplo de string
 </pre>


 4)  **Soma de dois números:**
```sql
SELECT 5 + 2;
```
<pre>
 ?column?
----------
        7
 </pre>


 5)  **Soma de dois números e alias:**
```sql
SELECT 5 + 2 AS resultado;
```
<pre>
 resultado
-----------
         7
 </pre>


 6)  **Concatenação e conversão para data:**
```sql
SELECT 'Hoje é ' || now()::date AS "Concatenação e cast para date";
```
<pre>
 Concatenação e cast para date
-------------------------------
 Hoje é 2017-07-05
 </pre>


 7)  **Concatenação e conversão para hora:**
```sql
SELECT 'Agora são ' || now()::time(0) AS "Concatenação e cast para time";
```
<pre>
 Concatenação e cast para time
-------------------------------
 Agora são 14:16:21
 </pre>
 ---
<a id="types"></a>
## Tipos de Dados

O PostgreSQL tem vários [tipos de dados](https://www.postgresql.org/docs/current/static/datatype.html).<br />
Cada atributo de uma entidade tem um tipo mais adequado.

* [Numéricos](https://www.postgresql.org/docs/current/static/datatype-numeric.html)
* [String](https://www.postgresql.org/docs/current/static/datatype-character.html)
* [Binários](https://www.postgresql.org/docs/current/static/datatype-binary.html)
* [Data / Hora](https://www.postgresql.org/docs/current/static/datatype-datetime.html)
* [Lógicos ("Booleanos")](https://www.postgresql.org/docs/current/static/datatype-boolean.html)
* [Enumerados](https://www.postgresql.org/docs/current/static/datatype-enum.html)
* [Geométricos](https://www.postgresql.org/docs/current/static/datatype-geometric.html)
* [Tipos Dados de Rede](https://www.postgresql.org/docs/current/static/datatype-net-types.html)
* [Bit String](https://www.postgresql.org/docs/current/static/datatype-bit.html)
* [Busca Textual (Full Text Search)](https://www.postgresql.org/docs/current/static/datatype-textsearch.html)
* [UUID](https://www.postgresql.org/docs/current/static/datatype-uuid.html)
* [XML](https://www.postgresql.org/docs/current/static/datatype-xml.html)
* [JSON](https://www.postgresql.org/docs/current/static/datatype-json.html)
* [Arrays](https://www.postgresql.org/docs/current/static/arrays.html)
* [Tipos Compostos](https://www.postgresql.org/docs/current/static/rowtypes.html)
* [Tipos de Faixa (Range Types)](https://www.postgresql.org/docs/current/static/rangetypes.html)

Além dos tipos de dados variados é interessante conhecer também [máscaras de dados](https://www.postgresql.org/docs/current/static/functions-formatting.html).

<br /><br />

8) **Tipo inteiro padrão (int4; 4 bytes):**
```sql
SELECT pg_typeof(7);
```
<pre>
 pg_typeof
-----------
 integer
</pre>


9) **Tipo inteiro de 2 bytes:**
```sql
SELECT pg_typeof(7::int2);
```
<pre>
 pg_typeof
-----------
 smallint
</pre>


10) **Tipo inteiro de 8 bytes:**
```sql
SELECT pg_typeof(7::int8);
```
<pre>
 pg_typeof
-----------
 bigint
</pre>


11) **Tipo desconhecido de string:**
```sql
SELECT pg_typeof('foo');
```
<pre>
 pg_typeof
-----------
 unknown
</pre>


12) **Tipo de string VARCHAR:**
```sql
SELECT pg_typeof('foo'::varchar);
```
<pre>
     pg_typeof     
-------------------
 character varying
</pre>


13) **Tipo de string TEXT:**
```sql
SELECT pg_typeof('foo'::text);
```
<pre>
 pg_typeof
-----------
 text
</pre>


14) **Tipo para endereço IP:**
```sql
SELECT '192.168.0.1'::inet;
```
<pre>
    inet     
-------------
 192.168.0.1
</pre>


15) **E se for colocado um IP inválido?:**
```sql
SELECT '192.168.0.256'::inet;
```
<pre>
ERROR:  invalid input syntax for type inet: "192.168.0.256"
LINE 1: SELECT '192.168.0.256'::inet;
               ^
</pre>


16) **Endereço MAC:**
```sql
SELECT '00:01:07:f4:cb:55'::macaddr;
```
<pre>
      macaddr      
-------------------
 00:01:07:f4:cb:55
</pre>


17) **Endereço CIDR:**
```sql
SELECT '192.168/25'::cidr;
```
<pre>
      cidr      
----------------
 192.168.0.0/25
</pre>


18)  **Validação IPv4:**
```sql
SELECT 'fe80::f67e:5b4f:d208:713a/64'::inet;
```
<pre>
             inet             
------------------------------
 fe80::f67e:5b4f:d208:713a/64
</pre>


19)  **Tamanho de um endereço de rede como texto:**
```sql
SELECT pg_column_size('fe80::f67e:5b4f:d208:713a/64'::text);
```
<pre>
 pg_column_size
----------------
             32
</pre>



20)  **Tamanho de um endereço de rede como inet:**
```sql
SELECT pg_column_size('fe80::f67e:5b4f:d208:713a/64'::inet);
```
<pre>
 pg_column_size
----------------
             22
</pre>



21)  **Máscara para CPF:**
```sql
SELECT to_char(39684721495, '999"."999"."999-99') AS cpf;
```
<pre>
       cpf       
-----------------
  396.847.214-95
</pre>



22)  **Converter para algarismos romanos:**
```sql
SELECT to_char(2017, 'RN');
```
<pre>
     to_char     
-----------------
          MMXVII
</pre>



23)  **Número com 7 dígitos, 2 são para casas decimais:**
```sql
SELECT 10500::numeric(7, 2);
```
<pre>
 numeric  
----------
 10500.00
</pre>

---
<a id="ddl"></a>
## DDL

*Data Definition Language* é uma subdivisão de SQL que trata da manipulação de objetos do banco de dados.<br />
Seus principais comandos são:<p />

* CREATE (criação);
* DROP (remoção);
* ALTER (alteração).<p />


Alguns tipos de objetos de bancos de dados: DATABASE, SCHEMA, TABLE, VIEW, SEQUENCE, TRIGGER, etc...<br /><br />

24)  **Criação de uma nova base de dados:**
```sql
CREATE DATABASE db_workshop;
```



25)  **Usar o meta-comando \c do cliente psql para se conectar à nova base de dados:**
```sql
\c db_workshop
```



26)  **Função que retorna a base de dados atual:**
```sql
SELECT current_database();
```
<pre>
 current_database
------------------
 db_workshop
</pre>



27)  **Função que retorna o usuário atual:**
```sql
SELECT current_user;
```
<pre>
 current_user
--------------
 postgres
</pre>



28)  **Criação de uma nova tabela:**
```sql
CREATE TABLE tb_produto(
    id serial PRIMARY KEY,
    nome varchar(50) NOT NULL,
    preco numeric(7, 2) NOT NULL,
    descricao text);
```



29)  **Verificar a estrutura da tabela:**
```sql
\d tb_produto
```
<pre>
                                  Table "public.tb_produto"
  Column   |         Type          |                        Modifiers                        
-----------+-----------------------+---------------------------------------------------------
 id        | integer               | not null default nextval('tb_produto_id_seq'::regclass)
 nome      | character varying(50) | not null
 preco     | numeric(7,2)          | not null
 descricao | text                  |
Indexes:
    "tb_produto_pkey" PRIMARY KEY, btree (id)
</pre>




30)  **Alterar a tabela adicionando um novo campo:**
```sql
ALTER TABLE tb_produto ADD COLUMN campo_inteiro INT;
```




31)  **Alterar o nome da tabela:**
```sql
ALTER TABLE tb_produto RENAME TO tb_prod;
```



32)  **Verificar a estrutura da tabela:**
```sql
\d tb_prod
```
<pre>
                                     Table "public.tb_prod"
    Column     |         Type          |                        Modifiers                        
---------------+-----------------------+---------------------------------------------------------
 id            | integer               | not null default nextval('tb_produto_id_seq'::regclass)
 nome          | character varying(50) | not null
 preco         | numeric(7,2)          | not null
 descricao     | text                  |
 campo_inteiro | integer               |
Indexes:
    "tb_produto_pkey" PRIMARY KEY, btree (id)
</pre>



33)  **Criação de uma nova tabela:**
```sql
CREATE TABLE tb_foo (campo INT);
```



34)  **Criação de um novo schema:**
```sql
CREATE SCHEMA sc_teste;
```



 35)  **Listando os schemas:**
```sql
SELECT nspname AS schema FROM pg_namespace;
```
<pre>
       schema       
--------------------
 pg_toast
 pg_temp_1
 pg_toast_temp_1
 pg_catalog
 public
 information_schema
 sc_teste
</pre>



36)  **Criação de uma nova tabela:**
```sql
CREATE TABLE tb_foo (campo INT);
```



37)  **Criação de uma nova tabela no novo schema:**
```sql
CREATE TABLE sc_teste.tb_foo(
    campo1 INT,
    campo2 INT);
```


38)  **Pelo catálogo do sistema verificar as tabelas criadas pelo usuário:**
```sql
SELECT tablename AS tabela, schemaname AS schema
    FROM pg_tables
    WHERE schemaname !~ 'information_schema|pg_.*';
```
<pre>
 tabela  |  schema  
---------+----------
 tb_prod | public
 tb_foo  | public
 tb_foo  | sc_teste
</pre>



39)  **Criação de uma view baseada na consulta anterior:**
```sql
CREATE VIEW vw_tabelas AS
    SELECT tablename AS tabela, schemaname AS schema
    FROM pg_tables
    WHERE schemaname !~ 'information_schema|pg_.*';
```



40)  **Consulta na view criada:**
```sql
SELECT schema || '.' || tabela AS "Tabela com namespace" FROM vw_tabelas;
```
<pre>
 Tabela com namespace
----------------------
 public.tb_prod
 public.tb_foo
 sc_teste.tb_foo
</pre>



40)  **Apagando as tabelas criadas:**
```sql
DROP TABLE public.tb_prod, public.tb_foo, sc_teste.tb_foo;
```



41)  **Apagando a view criada:**
```sql
DROP VIEW vw_tabelas;
```



42)  **Apagando o schema criado:**
```sql
DROP SCHEMA sc_teste;
```

 ---
<a id="dml"></a>
## DML

*Data Manipulation Language* é a parte da linguagem SQL que trata da manipulação de registros.<br />
Fazendo uma analogia, em linguagens de programação temos o conceito de **CRUD**:<p />

| CRUD | SQL |
| --- | --- |
| *Create* (criar)          | INSERT  |
| *Retrieve* (buscar)    | SELECT |
| *Update* (modificar) | UPDATE |
| *Delete* (apagar)      | DELETE |


43) **Criação de tabela de teste:**
```sql
CREATE TABLE tb_teste(
    id serial PRIMARY KEY,
    campo1 varchar(10),
    campo2 int);
```



44) **Verificando a estrutura da tabela:**
```sql
\d tb_teste
```
<pre>
                                Table "public.tb_teste"
 Column |         Type          |                       Modifiers                       
--------+-----------------------+-------------------------------------------------------
 id     | integer               | not null default nextval('tb_teste_id_seq'::regclass)
 campo1 | character varying(10) |
 campo2 | integer               |
Indexes:
    "tb_teste_pkey" PRIMARY KEY, btree (id)
</pre>


45) **Inserir um registro:**
```sql
INSERT INTO tb_teste (campo1, campo2) VALUES ('foo', 25);
```



46) **Veriricar o valor atual da sequence:**
```sql
SELECT currval('tb_teste_id_seq');
```
<pre>
 currval
---------
       1
</pre>



47) **Inserir valores:**
```sql
INSERT INTO tb_teste VALUES (2, 'bar', (random() * 100)::int);
```



48) **Veriricar o valor atual da sequence:**
```sql
SELECT currval('tb_teste_id_seq');
```
<pre>
 currval
---------
       1
</pre>



49) **INSERT múltiplo:**
```sql
INSERT INTO tb_teste (campo1, campo2) VALUES
    ('spam', 58),
    ('eggs', 87),
    ('foobar', 92),
    ('spameggs', 43),
    ('eggsspam', 99);
```
<pre>
ERROR:  duplicate key value violates unique constraint "tb_teste_pkey"
DETAIL:  Key (id)=(2) already exists.
</pre>



50) **Veriricar o valor atual da sequence:**
```sql
SELECT currval('tb_teste_id_seq');
```
<pre>
 currval
---------
       2
</pre>



51) **INSERT múltiplo:**
```sql
INSERT INTO tb_teste (campo1, campo2) VALUES
    ('spam', 58),
    ('eggs', 87),
    ('foobar', 92),
    ('spameggs', 43),
    ('eggsspam', 99);
```



52) **INSERT com SELECT:**
```sql
INSERT INTO tb_teste (campo1, campo2)
    SELECT 'string', 77;
```



53) **Comando TABLE para selecionar todos os registros e todas as colunas:**
```sql
TABLE tb_teste;
```
<pre>
 id |  campo1  | campo2
----+----------+--------
  1 | foo      |     25
  2 | bar      |     12
  3 | spam     |     58
  4 | eggs     |     87
  5 | foobar   |     92
  6 | spameggs |     43
  7 | eggsspam |     99
  8 | string   |     77
</pre>



54) **Selecionar todos os registros e todas as colunas:**
```sql
SELECT * FROM tb_teste;
```
<pre>
 id |  campo1  | campo2
----+----------+--------
  1 | foo      |     25
  2 | bar      |     12
  3 | spam     |     58
  4 | eggs     |     87
  5 | foobar   |     92
  6 | spameggs |     43
  7 | eggsspam |     99
  8 | string   |     77
</pre>



55) **Explicitar campos e filtrar por valores de id maior ou igual a 5:**
```sql
SELECT id, campo2, campo1 FROM tb_teste WHERE id >= 5;
```
<pre>
 id | campo2 |  campo1  
----+--------+----------
  5 |     92 | foobar
  6 |     43 | spameggs
  7 |     99 | eggsspam
  8 |     77 | string
</pre>



56) **Iniciar uma transação:**
```sql
BEGIN;
```



57) **UPDATE sem WHERE:**
```sql
UPDATE tb_teste SET campo2 = 100;
```



58) **Comando TABLE:**
```sql
TABLE tb_teste;
```
<pre>
 id |  campo1  | campo2
----+----------+--------
  1 | foo      |    100
  2 | bar      |    100
  3 | spam     |    100
  4 | eggs     |    100
  5 | foobar   |    100
  6 | spameggs |    100
  7 | eggsspam |    100
  8 | string   |    100
</pre>



59) **ROLLBACK na transação:**
```sql
ROLLBACK;
```



60) **Comando TABLE:**
```sql
TABLE tb_teste;
```
<pre>
 id |  campo1  | campo2
----+----------+--------
  1 | foo      |     25
  2 | bar      |     12
  3 | spam     |     58
  4 | eggs     |     87
  5 | foobar   |     92
  6 | spameggs |     43
  7 | eggsspam |     99
  8 | string   |     77
</pre>



61) **UPDATE com WHERE:**
```sql
UPDATE tb_teste SET campo2 = 100 WHERE id = 2;
```



62) **UPDATE com a cláusula BETWEEN e RETURNING:**
```sql
UPDATE tb_teste SET (campo1, campo2) = (NULL, 404)
    WHERE id BETWEEN 5 AND 9
    RETURNING campo1, campo2;
```
<pre>
 campo1 | campo2
--------+--------
        |    404
        |    404
        |    404
        |    404
</pre>



63) **Apagar todos registros onde o campo1 for NULL:**
```sql
DELETE FROM tb_teste WHERE campo1 IS NULL;
```



64) **DELETE com RETURNING:**
```sql
DELETE FROM tb_teste WHERE id = 4 RETURNING campo1, campo2;
```
<pre>
 campo1 | campo2
--------+--------
 eggs   |     87
</pre>



65) **Apagar a tabela de teste:**
```sql
DROP TABLE tb_teste;
```



66) **Criar a tabela de teste baseada em uma consulta:**
```sql
CREATE TABLE tb_teste AS SELECT generate_series(1, 2000000);
```


67) **Habilitar o cronômetro do psql:**
```sql
\timing
```



68) **DELETE sem WHERE:**
```sql
DELETE FROM tb_teste;
```
<pre>
Time: 8252,219 ms
</pre>



69) **Apagar a tabela de teste:**
```sql
DROP TABLE tb_teste;
```



70) **Criar a tabela de teste baseada em uma consulta:**
```sql
CREATE TABLE tb_teste AS SELECT generate_series(1, 2000000);
```



71) **TRUNCATE na tabela:**
```sql
TRUNCATE tb_teste;
```
<pre>
Time: 37,142 ms
</pre>



72) **Inserir valores através da função generate_series:**
```sql
INSERT INTO tb_teste SELECT generate_series(1, 20);
```



73) **Veriricar a tabela:**
```sql
TABLE tb_teste;
```
<pre>
 generate_series
-----------------
               1
               2
               3
               4
               5
               6
               7
               8
               9
              10
              11
              12
              13
              14
              15
              16
              17
              18
              19
              20
</pre>



74) **Limitar a 5 registros a serem exibidos:**
```sql
SELECT * FROM tb_teste LIMIT 5;
```
<pre>
 generate_series
-----------------
               1
               2
               3
               4
               5
</pre>



75) **Limitar a 5 registros a serem exibidos em ordem decrescente:**
```sql
SELECT generate_series FROM tb_teste ORDER BY generate_series DESC LIMIT 5;
```
<pre>
 generate_series
-----------------
              20
              19
              18
              17
              16
</pre>



76) **Não exibir 15 registros:**
```sql
SELECT generate_series FROM tb_teste OFFSET 15;
```
<pre>
 generate_series
-----------------
              16
              17
              18
              19
              20
</pre>



77) **Paginação de 5 em 5:**
```sql
SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 0;
```
<pre>
 generate_series
-----------------
               1
               2
               3
               4
               5
</pre>



78) **Paginação de 5 em 5:**
```sql
SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 5;
```
<pre>
 generate_series
-----------------
               6
               7
               8
               9
              10
</pre>



79) **Paginação de 5 em 5:**
```sql
SELECT generate_series FROM tb_teste LIMIT 5 OFFSET 10;
```
<pre>
 generate_series
-----------------
              11
              12
              13
              14
              15
</pre>



---

<a id="fk"></a>
## Chave Estrangeira

Especifica que o valor da coluna deve corresponder a um valor que esteja na
coluna da tabela referenciada.
Os valores dos campos referenciados devem ser únicos. Chamamos isso de
integridade referencial.<br />

80) **Criação da Tabela tb_uf:**
```sql
CREATE TEMP TABLE tb_uf(
    id char(2) PRIMARY KEY,
    nome VARCHAR(30));
```




81) **Criação da Tabela tb_cidade:**
```sql
CREATE TEMP TABLE tb_cidade(
    id serial PRIMARY KEY,
    nome VARCHAR(40),
    uf char(2) REFERENCES tb_uf (id));
```




82) **Tentativa de exclusão da tabela referenciada:**
```sql
DROP TABLE tb_uf;
```
<pre>
ERROR:  cannot drop table tb_uf because other objects depend on it
DETAIL:  constraint tb_cidade_uf_fkey on table tb_cidade depends on table tb_uf
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
</pre>




83) **Descrição da estratura de tb_uf:**
```sql
\d tb_uf
```
<pre>
          Table "pg_temp_2.tb_uf"
 Column |         Type          | Modifiers
--------+-----------------------+-----------
 id     | character(2)          | not null
 nome   | character varying(30) |
Indexes:
    "tb_uf_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "tb_cidade" CONSTRAINT "tb_cidade_uf_fkey" FOREIGN KEY (uf) REFERENCES tb_uf(id)
</pre>






83) **Descrição da estratura de tb_cidade:**
```sql
\d tb_cidade
```
<pre>
                               Table "pg_temp_4.tb_cidade"
 Column |         Type          |                       Modifiers                        
--------+-----------------------+--------------------------------------------------------
 id     | integer               | not null default nextval('tb_cidade_id_seq'::regclass)
 nome   | character varying(40) |
 uf     | character(2)          |
Indexes:
    "tb_cidade_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "tb_cidade_uf_fkey" FOREIGN KEY (uf) REFERENCES tb_uf(id)
</pre>




84) **Comando COPY para popular a tabela:**
```sql
COPY tb_uf (id, nome) FROM STDIN DELIMITER ',';
```
<pre>
Enter data to be copied followed by a newline.
End with a backslash and a period on a line by itself.
>>
</pre>


Em seguida os registros:

<pre>
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
</pre>

Dê &lt;ENTER&gt; e logo em seguida &lt;Ctrl&gt; + &lt;D&gt;.


85) **Inserir valores para a tabela tb_cidade:**
```sql
INSERT INTO tb_cidade (nome, uf) VALUES
    ('São Paulo', 'SP'),
    ('Belo Horizonte', 'MG'),
    ('Vitória', 'ES'),
    ('Rio de Janeiro', 'RJ');
```



86) **Tentativa de inserir valores cuja chave estrangeira não existe na tabela referenciada:**
```sql
INSERT INTO tb_cidade (nome, uf) VALUES
    ('foo', 'NN'),
    ('bar', 'NN');
```
<pre>
ERROR:  insert or update on table "tb_cidade" violates foreign key constraint "tb_cidade_uf_fkey"
DETAIL:  Key (uf)=(NN) is not present in table "tb_uf".
</pre>



87) **Inserir um registro novo em tb_uf para possibilitar o INSERT anterior:**
```sql
INSERT INTO tb_uf (id, nome) VALUES ('NN', '...');
```



88) **Inserir valores novos em tb_cidade:**
```sql
INSERT INTO tb_cidade (nome, uf) VALUES
    ('foo', 'NN'),
    ('bar', 'NN');
```



89) **Tentativa de apagar o registro da tabela referenciada:**
```sql
DELETE FROM tb_uf WHERE id = 'NN';
```
<pre>
ERROR:  update or delete on table "tb_uf" violates foreign key constraint "tb_cidade_uf_fkey" on table "tb_cidade"
DETAIL:  Key (id)=(NN) is still referenced from table "tb_cidade".
</pre>



90) **Apagando os registros da tabela referenciadora:**
```sql
DELETE FROM tb_cidade WHERE uf = 'NN';
```



91) **Tentativa de apagar o registro da tabela referenciada:**
```sql
DELETE FROM tb_uf WHERE id = 'NN';
```



92) **Apagando a tabela referenciada em modo cascata:**
```sql
DROP TABLE tb_uf CASCADE;
```
<pre>
NOTICE:  drop cascades to constraint tb_cidade_uf_fkey on table tb_cidade
</pre>



92) **Verificando a estrutura da tabela tb_cidade:**
```sql
\d tb_cidade
```
<pre>
                               Table "pg_temp_4.tb_cidade"
 Column |         Type          |                       Modifiers                        
--------+-----------------------+--------------------------------------------------------
 id     | integer               | not null default nextval('tb_cidade_id_seq'::regclass)
 nome   | character varying(40) |
 uf     | character(2)          |
Indexes:
    "tb_cidade_pkey" PRIMARY KEY, btree (id)
</pre>


---
<a id="subqueries"></a>
## Subqueries

Também conhecidas como subqueries, são SELECTs embutidos dentro de outro
SELECT que têm por finalidade flexibilizar consultas. Esse recurso está disponível no
PostgreSQL desde a versão 6.3.

93) **Clonar o repositório db_empresa para os próximos exercícios:**
```bash
git clone https://github.com/juliano777/db_empresa.git
```




94) **Entrar no diretório db_empresa:**
```bash
cd db_empresa/
```



95) **Criar a estrutura da base de dados db_empresa:**
```bash
psql -f db_empresa-schema.sql
```



95) **Carregar os dados da base db_empresa:**
```bash
psql -f db_empresa-data.sql db_empresa
```


96) **Via shell, pelo psql se conectar na base:**
```bash
psql db_empresa
```


97) **Exibir os CPFs dos colaboradores cujo salário seja maior do que média com 90% de acréscimo:**
```sql
SELECT c1.cpf
    FROM tb_colaborador c1
    WHERE c1.salario > (SELECT (avg(c2.salario) * 1.9)
                     FROM tb_colaborador c2);
```
<pre>
cpf     
-------------
11111111111
23625814788
12345678901
</pre>



98) **Exibir o CPF e a diferença do salário relativa à média:**
```sql
SELECT c1.cpf "CPF", c1.salario -
    (SELECT avg(c2.salario) FROM tb_colaborador c2)::numeric(7, 2)
    "Diferença da Média"
    FROM tb_colaborador c1
    LIMIT 5;
```
<pre>
CPF          | Diferença da Média
-------------+--------------------
11111111111  |           17445.00
23625814788  |            7445.00
33344455511  |            1945.00
12345678901  |            2445.00
10236547895  |             945.00
</pre>



99) **Selecionar id de tb_colaborador onde o cpf não está entre os valores retornados da
subconsulta e o setor deve ser igual a 3:**
```sql
SELECT c.id
    FROM tb_colaborador c
    WHERE c.cpf NOT IN
        (SELECT p.cpf
            FROM tb_pf p
            WHERE p.dt_Nascto
                BETWEEN '1982-01-01' AND '1983-12-31') AND setor = 3;
```
<pre>
id
----
 9
11
12
13
15
</pre>


 ---
<a id="cte"></a>
## CTE

A cláusula WITH fornece uma maneira de escrever comandos auxiliares para uso em uma consulta maior. Esses comandos, que são frequentemente referenciados como Common Table Expressions ou CTEs, pode ser pensado como a definição de tabelas temporárias que existem apenas para uma consulta.<br />
Cada comando auxiliar em uma cláusula WITH pode ser um SELECT, INSERT, UPDATE, ou DELETE; e a cláusula WITH por si só é anexada a um comando principal que pode também ser um SELECT, INSERT, UPDATE, ou DELETE.

100) **Exibir os CPFs dos colaboradores cujo salário seja maior do que média com 90% de acréscimo:**
```sql
WITH c2 AS (SELECT (avg(salario) * 1.9) AS media FROM tb_colaborador)
    SELECT c1.cpf
        FROM tb_colaborador c1, c2
        WHERE c1.salario > c2.media;
```
<pre>
cpf     
-------------
11111111111
23625814788
12345678901
</pre>



101) **Exibir o CPF e a diferença do salário relativa à média:**
```sql
WITH c2 AS (SELECT avg(salario)::numeric(7, 2) media
            FROM tb_colaborador)
    SELECT c1.cpf "CPF", c1.salario - c2.media "Diferença da Média"
        FROM tb_colaborador c1, c2
        LIMIT 5;
```
<pre>
CPF          | Diferença da Média
-------------+--------------------
11111111111  |           17445.00
23625814788  |            7445.00
33344455511  |            1945.00
12345678901  |            2445.00
10236547895  |             945.00
</pre>

---
<a id="juncoes"></a>

## Junções

### CROSS JOIN

Retorna um conjunto de informações o qual é resultante de todas as combinações
possíveis entre os registros das tabelas envolvidas.

102) **Criação da tabela de carros:**
```sql
CREATE TEMP TABLE tb_carro(
    id serial PRIMARY KEY,
    nome VARCHAR(20));
```


103) **Criação da tabela de cares:**
```sql
CREATE TEMP TABLE tb_cor(
    id serial PRIMARY KEY,
    nome VARCHAR(20));
```


104) **Popular a tabela de carros:**
```sql
INSERT INTO tb_carro (nome) VALUES
    ('Fiat 147'),
    ('VW Fusca'),
    ('Ford Corcel'),
    ('GM Opala');
```


105) **Popular a tabela de cares:**
```sql
INSERT INTO tb_cor (nome) VALUES
    ('Verde'),
    ('Azul'),
    ('Amarelo'),
    ('Branco'),
    ('Preto'),
    ('Vermelho'),
    ('Laranja'),
    ('Cinza');
```



106) **Duas formas diferentes para fazer junção cruzada para obter as combinações possíveis exibindo somente os primeiros 5 registros:**
```sql
SELECT c1.nome carro, c2.nome cor
    FROM tb_carro c1, tb_cor c2
    LIMIT 5;
```

```sql
SELECT c1.nome carro, c2.nome cor
    FROM tb_carro c1
    CROSS JOIN
    tb_cor c2
    LIMIT 5;
```
<pre>
carro     |   cor   
----------+---------
Fiat 147  | Verde
Fiat 147  | Azul
Fiat 147  | Amarelo
Fiat 147  | Branco
Fiat 147  | Preto
</pre>


## NATURAL JOIN

Faz uma junção implícita tomando como base as colunas de mesmo nome nas
tabelas envolvidas.<br />
É recomendável que ao invés de usar NATURAL JOIN se use INNER JOIN, pois
essa última explicita qual é o critério de vínculo entre tabelas deixando a leitura mais
amigável.

107) **Duas formas diferentes para fazer junção cruzada para obter as combinações possíveis exibindo somente os primeiros 5 registros:**
```sql
SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    NATURAL JOIN tb_pf p
    WHERE c.salario >= 5000;
```
<pre>
nome        | sobrenome | salario  
------------+-----------+----------
Chiquinho   | da Silva  | 20000.00
Aldebarina  | Ferreira  | 10000.00
Tungstênia  | Santana   |  5000.00
</pre>


## INNER JOIN

Retorna as informações apenas de acordo com as linhas que obedeçam as
definições de relacionamento. Existe uma ligação lógica para se fazer a junção, a qual é
declarada explicitamente.<br />
É a junção padrão, que faz com que inclusive a palavra-chave INNER possa ser
omitida.<br />
Para o critério de junção pode-se usar a cláusula ON que especifca qual a condição
usada ou USING que apenas diz qual campo com o mesmo nome em ambas as tabelas
deve ser utilizado.

108) **INNER JOINs com ON e USING:**
```sql
SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    INNER JOIN tb_pf p
    ON c.cpf = p.cpf
    WHERE c.salario >= 5000;
```

```sql
SELECT p.nome, p.sobrenome, c.salario
    FROM tb_colaborador c
    INNER JOIN tb_pf p
    USING (cpf)
    WHERE c.salario >= 5000;
```
<pre>
nome        | sobrenome | salario  
------------+-----------+----------
Chiquinho   | da Silva  | 20000.00
Aldebarina  | Ferreira  | 10000.00
Tungstênia  | Santana   |  5000.00
</pre>


## OUTER JOIN

Assim como na INNER JOIN, existe uma ligação lógica, mas não retorna apenas
as informações que satisfaçam a regra da junção. OUTER JOINs podem ser dos tipos:

* LEFT OUTER JOIN: retorna todos os registros da tabela à esquerda;
* RIGHT OUTER JOIN: retorna todos os registros da tabela à direita;
* FULL OUTER JOIN: retorna todos os registros de ambos os lados.

É de uso opcional a palavra OUTER.<br />
Para os exercícios serão inseridos dados na tabela tb_pf, que não tenham
correspondência na tabela tb_colaborador.

109) **Inserir valores para os testes:**
```sql
INSERT INTO tb_pf VALUES
    ('Elzinda', '1979-05-03', NULL, '10293847567', '2233551177', 'Ambrózio',
     'f'),
    ('Carmelita', '1915-01-01', NULL, '00000000011', '0000000011', 'Antunes',
     'f'),
    ('Sizorfino', '1978-11-26', NULL, '00000000111', '0000000111', 'Chagas',
     'm');
```

### LEFT OUTER JOIN

110) **Tabela tb_pf à esquerda:**
```sql
SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_pf p
    LEFT OUTER JOIN tb_colaborador c
        USING (cpf)
    OFFSET 35;
```
<pre>
Nome Completo       | id
--------------------+----
Estriga Souto       | 36
Eltaminácio Santos  | 37
Maria dos Santos    | 38
Etelvino Castro     | 39
Carzózio da Silva   | 40
Genovézio Gomes     |   
Carmelita Antunes   |   
Elzinda Ambrózio    |   
Sizorfino Chagas    |
</pre>

### RIGHT OUTER JOIN

111) **Tabela tb_pf à direita:**
```sql
SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_colaborador c
    RIGHT OUTER JOIN tb_pf p USING (cpf)
    OFFSET 35;
```
<pre>
Nome Completo       | id
--------------------+----
Estriga Souto       | 36
Eltaminácio Santos  | 37
Maria dos Santos    | 38
Etelvino Castro     | 39
Carzózio da Silva   | 40
Genovézio Gomes     |   
Carmelita Antunes   |   
Elzinda Ambrózio    |   
Sizorfino Chagas    |
</pre>

### FULL OUTER JOIN

112) **FULL OUTER JOIN:**
```sql
SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_pf p
    FULL OUTER JOIN tb_colaborador c USING (cpf)
    OFFSET 35;
```

```sql
SELECT p.nome||' '||p.sobrenome "Nome Completo", c.id
    FROM tb_colaborador c
    FULL OUTER JOIN tb_pf p USING (cpf)
    OFFSET 35;
```
<pre>
Nome Completo       | id
--------------------+----
Estriga Souto       | 36
Eltaminácio Santos  | 37
Maria dos Santos    | 38
Etelvino Castro     | 39
Carzózio da Silva   | 40
Genovézio Gomes     |   
Carmelita Antunes   |   
Elzinda Ambrózio    |   
Sizorfino Chagas    |  
</pre>

---

<a id="index"></a>
## Indexação

Um índice (INDEX) é um recurso que agiliza buscas de informações em tabelas.
Imagine que você está em uma biblioteca e gostaria de procurar “O Senhor dos
Anéis”, de Tolkien. O que seria mais fácil?: Começar a vasculhar a biblioteca inteira até
achar o livro desejado ou buscar no arquivo da biblioteca, nas fichas que estão ordenados
por autor? Logicamente se for escolhido ir buscar nas fichas a busca será muito mais
rápida, pois não será necessário vasculhar livro por livro na biblioteca, porque haverá uma
ficha do autor e daquele livro que mostrará exatamente onde está o livro desejado. É um
apontamento para a localização do livro. Um índice de banco de dados funciona da
mesma forma.<br />
Indexamos campos usados como critérios de filtragem numa consulta (cláusula
WHERE, por exemplo) e aqueles cujos valores são mais restritivos comparados a outros
valores da tabela.<br />
Seu funcionamento consiste em criar ponteiros para dados gravados em campos
específicos. Quando não existe índice num campo usado como critério de filtragem, é
feita uma varredura em toda a tabela, de maneira que haverá execuções de entrada e
saída (I/O) de disco desnecessárias, além de também desperdiçar processamento.

### Dicas Gerais

* Crie índices para campos que são utilizados em condições de consultas, pelo
menos as consultas mais frequentes;
* Crie índices para campos de chaves estrangeiras e em campos envolvidos como
critérios de junção (JOIN);
* Se houver uma consulta frequente utilize índices parciais com sua condição
conforme a consulta;
* Para consultas que buscam faixas de valores é bom ter um índice clusterizado para
isso.


113) **Criação de tabela de teste:**
```sql
SELECT
    generate_series(1, 20000)::int2 AS campo1, -- 20 mil registros
    round((random()*10000))::int2 AS campo2,
    round((random()*10000))::int2 AS campo3 INTO tb_index;
```

114) **Verificando o plano de execução:**
```sql
EXPLAIN ANALYZE
SELECT campo1 FROM tb_index WHERE campo2 BETWEEN 235 AND 587;
```
<pre>
QUERY PLAN                                                
---------------------------------------------------------------------------------------------------------
Seq Scan on tb_index  (cost=0.00..389.00 rows=688 width=2) (actual time=0.036..10.163 rows=679 loops=1)
Filter: ((campo2 >= 235) AND (campo2 <= 587))
Rows Removed by Filter: 19321
Planning time: 0.189 ms
Execution time: 10.245 ms
</pre>


115) **Criação de índice:**
```sql
CREATE INDEX idx_tb_index_campo2 ON tb_index (campo2);
```

116) **Verificando o plano de execução:**
```sql
EXPLAIN ANALYZE
SELECT campo1 FROM tb_index WHERE campo2 BETWEEN 235 AND 587;
```
<pre>
    QUERY PLAN                                                            
---------------------------------------------------------------------------------------------------------------------------------
Bitmap Heap Scan on tb_index  (cost=15.34..114.66 rows=688 width=2) (actual time=0.344..0.981 rows=679 loops=1)
Recheck Cond: ((campo2 >= 235) AND (campo2 <= 587))
Heap Blocks: exact=89
->  Bitmap Index Scan on idx_tb_index_campo2  (cost=0.00..15.17 rows=688 width=0) (actual time=0.305..0.305 rows=679 loops=1)
Index Cond: ((campo2 >= 235) AND (campo2 <= 587))
Planning time: 0.363 ms
Execution time: 1.073 ms
</pre>

117) **Criação de índice composto:**
```sql
CREATE INDEX idx_tb_index_campo2_campo3 ON tb_index (campo2, campo3);
```

118) **Verificando o plano de consulta:**
```sql
EXPLAIN ANALYZE
SELECT campo1 FROM tb_index
    WHERE (campo2 BETWEEN 235 AND 587) AND campo3 = 1000;
```
<pre>
QUERY PLAN                                                              
--------------------------------------------------------------------------------------------------------------------------------------
Index Scan using idx_tb_index_campo2_campo3 on tb_index  (cost=0.29..20.90 rows=1 width=2) (actual time=0.086..0.190 rows=1 loops=1)
Index Cond: ((campo2 >= 235) AND (campo2 <= 587) AND (campo3 = 1000))
Planning time: 0.414 ms
Execution time: 0.227 ms
</pre>

119) **Apagando a tabela do exercício anterior:**
```sql
DROP TABLE tb_index;
```

120) **Criação da Tabela de Teste (Não Temporária):**
```sql
CREATE TABLE tb_index(campo1 int);
```

121) **Inserção de 1 Milhão de Registros:**
```sql
INSERT INTO tb_index SELECT generate_series(1, 1000000);
```

122) **Análise sem Índices de Valores Múltiplos de 19:**
```sql
EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;
```
<pre>
QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
Seq Scan on tb_index  (cost=0.00..19425.00 rows=5000 width=4) (actual time=0.033..309.389 rows=52631 loops=1)
Filter: ((campo1 % 19) = 0)
Rows Removed by Filter: 947369
Planning time: 0.117 ms
Execution time: 311.717 ms
</pre>


123) **Criação de Índice Total:**
```sql
CREATE INDEX idx_teste_index_total ON tb_index (campo1);
```


124) **Verifica o plano de execução:**
```sql
EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;
```
<pre>
QUERY PLAN                                                   
---------------------------------------------------------------------------------------------------------------
Seq Scan on tb_index  (cost=0.00..19425.00 rows=5000 width=4) (actual time=0.036..313.418 rows=52631 loops=1)
Filter: ((campo1 % 19) = 0)
Rows Removed by Filter: 947369
Planning time: 0.271 ms
Execution time: 315.805 ms
</pre>

125) **Criação de índice parcial múltiplos de 19:**
```sql
CREATE INDEX idx_teste_index_19 ON tb_index (campo1) WHERE campo1 % 19 = 0;
```

126) **Análise com valores múltiplos de 19:**
```sql
EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 % 19 = 0;
```
<pre>
QUERY PLAN                                                                 
--------------------------------------------------------------------------------------------------------------------------------------------
Index Only Scan using idx_teste_index_19 on tb_index  (cost=0.29..157.29 rows=5000 width=4) (actual time=0.053..37.198 rows=52631 loops=1)
Heap Fetches: 52631
Planning time: 0.321 ms
Execution time: 40.926 ms
</pre>


127) **Análise com uma consulta de condição diferente de números divíveis por 19:**
```sql
EXPLAIN ANALYZE
SELECT * FROM tb_index WHERE campo1 BETWEEN 241 AND 875;
```
<pre>
QUERY PLAN                                                                
------------------------------------------------------------------------------------------------------------------------------------------
Index Only Scan using idx_teste_index_total on tb_index  (cost=0.42..26.82 rows=620 width=4) (actual time=0.043..0.487 rows=635 loops=1)
Index Cond: ((campo1 >= 241) AND (campo1 <= 875))
Heap Fetches: 635
Planning time: 0.333 ms
Execution time: 0.563 ms
</pre>
---
<a id="range"></a>
## Range Types

Range Types são tipos de dados que representam uma faixa de valores de algum
tipo de elemento (chamado de subtipo de faixa).

### Simbologia de Limites de Intervalos

( ) → Parênteses: para simbolizar respectivamente limites inicial e final do tipo aberto;<br />
\[ \] → Colchetes: representam respectivamente limites inicial e final do tipo fechado.

### Built-in Range Types
O PostgreSQL nativamente vem com os seguintes range types:
* int4range: Inteiro de 4 bytes (int4, int, integer);
* int8range: Inteiro de 8 bytes (int8, bigint);
* numrange: Ponto flutuante (numeric);
* tsrange: timestamp sem time zone;
* tstzrange: timestamp com time zone;
* daterange: Data (date)

Em adição, você pode definir seus próprios range types; veja CREATE TYPE para mais informações.

128) **Intervalo fechado de 2 a 9 (int4):**
```sql
SELECT '[2, 9]'::int4range;
```
<pre>
int4range
-----------
[2,10)
</pre>

129) **Intervalo aberto em 2 e fechado em 9 (int4):**
```sql
SELECT '(2, 9]'::int4range;
```
<pre>
int4range
-----------
[3,10)
</pre>

130) **Intervalos fechados usando data:**
```sql
SELECT '[2017-07-15 09:00, 2017-07-15 14:00]'::tsrange;
```
<pre>
tsrange                    
-----------------------------------------------
["2017-07-15 09:00:00","2017-07-15 14:00:00"]
</pre>

131) **No intervalo de 10 a 20 contém 3 (função int4range)?**
```sql
SELECT int4range(10, 20) @> 3;
```
<pre>
 ?column?
----------
 f
</pre>

132) **O valor 10 está contido entre 10 e 20 (função int4range)?**
```sql
SELECT 10 <@ int4range(10, 20);
```
<pre>
?column?
----------
t
</pre>

133) **Para fixação dos conceitos aprendidos nos exercícios anteriores, agora vamos criar uma tabela de reservas:**
```sql
CREATE TABLE tb_reserva(
    sala int PRIMARY KEY,
    duracao tsrange);
```

134) **Populando a tabela:**
```sql
INSERT INTO tb_reserva VALUES
    (1, '[2014-11-01 14:30, 2014-11-01 18:30)'),
    (2, '[2014-11-02 11:00, 2014-11-02 15:00)'),
    (3, '[2014-11-03 11:00, 2014-11-03 15:00)'),
    (4, '[2014-11-04 17:00, 2014-11-04 19:00)');
```

135) **Verificando a tabela:**
```sql
TABLE tb_reserva;
```
<pre>
sala  |                    duracao                    
------+-----------------------------------------------
   1  | ["2014-11-01 14:30:00","2014-11-01 18:30:00")
   2  | ["2014-11-02 11:00:00","2014-11-02 15:00:00")
   3  | ["2014-11-03 11:00:00","2014-11-03 15:00:00")
   4  | ["2014-11-04 17:00:00","2014-11-04 19:00:00")
</pre>   


136) **Verificando se há alguma sala cuja data e hora esteja contida em alguma duração de reserva:**
```sql
SELECT * FROM tb_reserva WHERE '2014-11-02 12:33'::timestamp <@ duracao;
```
<pre>
sala  |                    duracao                    
------+-----------------------------------------------
   2  | ["2014-11-02 11:00:00","2014-11-02 15:00:00")
</pre>


137) **Verificando se há alguma sala cuja duração contém a data e hora informada:**
```sql
SELECT * FROM tb_reserva WHERE duracao @> '2014-11-03 14:21'::timestamp;
```
<pre>
sala  |                    duracao                    
------+-----------------------------------------------
   3  | ["2014-11-03 11:00:00","2014-11-03 15:00:00")
</pre>

---
<a id="domain"></a>
## DOMAIN

Domínio é um tipo de dado personalizado em que se pode definir como os dados
serão inseridos de acordo com restrições definidas opcionalmente.

138) **Criação de um domínio, para validar CEPs que aceita inteiros com sete ou oito dígitos:**
```sql
CREATE DOMAIN dom_cep AS integer
    CONSTRAINT chk_cep
        CHECK (length(VALUE::text) = 7
        OR length(VALUE::text) = 8);
```

139) **Criação de uma tabela que usará o domínio criado como tipo de dado para uma coluna:**
```sql
CREATE TEMP TABLE tb_endereco_tmp(
    id serial PRIMARY KEY,
    cep dom_cep,
    logradouro text,
    numero smallint,
    cidade varchar(50),
    uf char(2));
```


140) **Inserções na Tabela com o domíno criado:**
```sql
INSERT INTO tb_endereco_tmp (cep, logradouro, numero, cidade, uf) VALUES
    (1001000, 'Pça. da Sé', null,'São Paulo','SP'),
    (30130003, 'Av. Afonso Pena', 1212, 'Belo Horizonte', 'MG');
```


141) **Selecionando os dados:**
```sql
SELECT
    to_char(cep, '00000-000') "CEP",
    logradouro "Logradouro",
    numero "Número",
    cidade "Cidade",
    uf "Estado"
    FROM tb_endereco_tmp;
```
<pre>
    CEP     |   Logradouro    | Número |     Cidade     | Estado
------------+-----------------+--------+----------------+--------
  01001-000 | Pça. da Sé      |        | São Paulo      | SP
  30130-003 | Av. Afonso Pena |   1212 | Belo Horizonte | MG
</pre>

---
<a id="python"></a>
## Acessando o Postgres via Python (psycopg2)

```python
import pprint  # Módulo "Pretty Print"
import psycopg2  # Driver PostgreSQL

# String de conexão
str_conexao = """
dbname='db_empresa'
user='aluno'
password='123'
host='192.168.56.2'
application_name='pypg'
options='-c log_min_duration_statement=0'
"""

# Dentro do bloco try fazer a conexão ao banco
try:
    # Conexão ao banco
    conexao = psycopg2.connect(str_conexao)

except Exception as e:
    # Exibe a string abaixo e também a mensagem de Exception
    print('Erro de conexão!\n\n{}'.format(e))

# Após a conexão devidamente estabelecida se conecte ao servidor de banco
# de dados via SSH.
# Se conecte localmente via psql e execute a seguinte query:
# SELECT * FROM pg_stat_activity WHERE client_addr IS NOT NULL;



# Criação de cursor para executar queries
cursor = conexao.cursor()


# String SQL
str_sql = 'SELECT cpf, nome, sobrenome FROM tb_pf;'

# Executa o comando SQL
cursor.execute(str_sql)

# Linhas retornadas pela consulta
rows = cursor.fetchall()

# Verifica o tipo da variável
type(rows)

# Criação da variável para impressão amigável em tela
pp = pprint.PrettyPrinter(indent=4)

# Método pprint para exibir de forma amigável o conteúdo de rows
pp.pprint(rows)

# Exibe a segunda linha
print(rows[1])

# Segunda linha e primeira coluna (cpf)
print(rows[1][0])


# String SQL
str_sql = "INSERT INTO tb_pf (cpf, nome) VALUES (95123785247, 'Foo');"


# Executa o comando SQL
cursor.execute(str_sql)


# Verifique no banco se o registro foi inserido

# Verifica se a conexão está fechada (0 = aberta, 1 = fechada)
conexao.closed

# Verifica se o cursor está fechado (booleano)
cursor.closed

# Efetiva todos os comandos dados na conexão
conexao.commit()

# Fecha a conexão
conexao.close()

# Checa se a conexão está fechada
conexao.closed

# Checa se o cursor está fechado
cursor.closed

# Fazer uma nova conexão
try:
    # Conexão ao banco
    conexao = psycopg2.connect(str_conexao)

except Exception as e:
    # Exibe a string abaixo e também a mensagem de Exception
    print('Erro de conexão!\n\n{}'.format(e))

# Determina que a conexão não será transacional
conexao.set_session(readonly=False, autocommit=True)

# Criação de um novo cursor
cursor = conexao.cursor()

# String SQL
str_sql = "INSERT INTO tb_pf (cpf, nome) VALUES (17223785247, 'Bar');"

# Executa o comando SQL
cursor.execute(str_sql)

# Determina que a conexão será somente leitura
conexao.set_session(readonly=True, autocommit=True)


# String SQL
str_sql = "INSERT INTO tb_pf (cpf, nome) VALUES (33223785247, 'Foo Bar');"


# Executa o comando SQL
cursor.execute(str_sql)
```

---

<a id="plpython"></a>
## PL/Python: Programando em Python no PostgreSQL

Sintaxe:

```
CREATE [OR REPLACE FUNCTION] funcao([params])
RETURNS tipo AS $$
. . .
codigo
. . .
$$ LANGUAGE linguagem;
```

### PL/pgSQL


142) **Criação da função fc_foo sem parâmetros:**
```sql
CREATE OR REPLACE FUNCTION fc_foo()
RETURNS VARCHAR AS $$

BEGIN
    RETURN 'Hello, World!';
END; $$ LANGUAGE PLPGSQL;
```


143) **Criação da função fc_foo com parâmetros:**
```sql
CREATE OR REPLACE FUNCTION fc_foo(num1 INT, num2 INT)
RETURNS INT AS $$

DECLARE res INT;

BEGIN
    RETURN (num1 + num2) * 2;
END; $$ LANGUAGE PLPGSQL;
```

144) **Execução da função fc_foo sem parâmetros:**
```sql
SELECT fc_foo();
```
<pre>
fc_foo     
---------------
Hello, World!
</pre>

145) **Execução da função fc_foo com parâmetros:**
```sql
SELECT fc_foo(2, 5);
```
<pre>
fc_foo
--------
    14
</pre>

### Blocos Anônimos

Sintaxe:

```
DO $$

. . .
codigo
. . .
$$ LANGUAGE linguagem;
```

146) **Ajustando o nível de mensagens para a aplicação cliente:**
```sql
SET client_min_messages = 'notice';
```

147) **Bloco anônimo para mostrar o número conexões ao banco no momento:**
```sql
DO $$
DECLARE n_con INT;
BEGIN
    SELECT count(client_addr)
        INTO n_con
        FROM pg_stat_activity;

    RAISE NOTICE
        'Número de conexões não-locais ao banco: %',
        n_con;

END; $$ LANGUAGE PLPGSQL;
```
<pre>
NOTICE:  Número de conexões não-locais ao banco: 10
</pre>


### PL/Python



148) **($) Crie o diretório Python para módulos:**

```bash
mkdir /var/lib/pgsql/python
```

149) **($) Variável de ambiente Python no arquivo de perfil do usuário de
sistema postgres:**

```bash
echo 'export PYTHONPATH="${PYTHONPATH}:/var/lib/pgsql/python' >> \
~postgres/.bashrc
```

150) **($) Variável de ambiente Python no arquivo de perfil do usuário de
sistema postgres:**

```bash
echo 'export PYTHONPATH="${PYTHONPATH}:/var/lib/pgsql/python' >> \
~postgres/.bashrc
```

151) **(#) Podemos incluir a variável PYTHONPATH no Unit File SystemD do serviço
do PostgreSQL:**

```bash
systemctl edit --full postgresql.service
```

Na sessão Unit, diretiva Environment do Unit File:

```
[Unit]
. . .
Environment=PYTHONPATH=/var/lib/pgsql/python
```

152) **(#) Reinicialize o serviço do PostgreSQL:**

```bash
systemctl restart postgresq.service
```













---
