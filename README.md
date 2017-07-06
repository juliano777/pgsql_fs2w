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
 * [**Relacionamentos**](#relacionamentos)
 * [**Subqueries**](#subqueries)
 * [**CTE**](#cte)
 * [**Junções**](#juncoes)
 * [**Indexação**](#index)
 * [**CREATE TYPE**](#c_type)
 * [**DOMAIN**](#domain)
 * [**Range Types**](#range)
 * [**Acessando o Postgres via Python (psycopg2)**](#python)
---

 

**Preparação do Ambiente**<a id="preparacao"></a><p /> 

---
**Sobre o PostgreSQL**<a id="pg"></a><p />

---
**SQL**<a id="sql"></a><p />

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
**Tipos de Dados**<a id="types"></a><p />

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
**DDL**<a id="ddl"></a><p />

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

 
 
28)  **Criação de uma nova:**
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
```

 
 
30)  **Alterar a tabela adicionando um novo campo:**
```sql
ALTER TABLE tb_produto ADD COLUMN campo_inteiro INT;
```




---
**DML**<a id="dml"></a><p />
---
**Relacionamentos**<a id="relacionamentos"></a><p />
---
 **Subqueries**<a id="subqueries"></a><p />
 ---
**CTE**<a id="cte"></a><p />
---
**Junções**<a id="juncoes"></a><p />
---
**Indexação**<a id="index"></a><p />
---
**CREATE TYPE**<a id="c_type"></a><p />
---
**DOMAIN**<a id="domain"></a><p />
---
**Range Types**<a id="range"></a><p />
---
**Acessando o Postgres via Python (psycopg2)**<a id="python"></a><p />
---
