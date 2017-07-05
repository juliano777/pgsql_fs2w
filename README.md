<h1>Workshop</h1>
<img src="img/pg.png" alt="PostgreSQL logo" />


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
