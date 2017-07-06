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
<p />
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

```
<pre>

</pre>
 
 
14)  **:**
```sql
SELECT '192.168.0.0/8'::inet;
```
<pre>
     inet      
---------------
 192.168.0.0/8
</pre>

---
**DDL**<a id="ddl"></a><p />
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
