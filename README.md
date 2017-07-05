<p align="center">
<img src="img/pg.png" />
<h1 align="center">Workshop PostgreSQL</h1>
</p>




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

 

**Preparação do Ambiente**<a id="preparacao"></a><p /> 
**Sobre o PostgreSQL**<a id="pg"></a><p />
**SQL**<a id="sql"></a><p />
**Structured Query Language** – **Linguagem Estruturada de Consulta**, é a linguagem usada nos SGBDs relacionais por padrão, no entanto cada um tem suas particularidades dentro da própria linguagem, tendo implementações diferentes.
<br />O mesmo objetivo pode ser feito de formas SQL diferentes de um SGBD pra outro.
<br />Assim como em linguagens de programação “comuns”, existem palavras reservadas, as quais não podem ser usadas como identificadores.
<br />Cada comando SQL é finalizado com ponto e vírgula (;).<p />

```sql
SELECT 'Um exemplo de string';
```
<pre>
       ?column?       
----------------------
 Um exemplo de string
 </pre>

```sql
 SELECT 'Um exemplo de string' AS apelido;
 ```
 
       apelido        
----------------------
 Um exemplo de string

```sql
 SELECT 'Um exemplo de string' AS "apelido com espaço";
 ```
  apelido com espaço  
----------------------
 Um exemplo de string



**Tipos de Dados**<a id="types"></a><p />
**DDL**<a id="ddl"></a><p />
**DML**<a id="dml"></a><p />
**Relacionamentos**<a id="relacionamentos"></a><p />
 **Subqueries**<a id="subqueries"></a><p />
**CTE**<a id="cte"></a><p />
**Junções**<a id="juncoes"></a><p />
**Indexação**<a id="index"></a><p />
**CREATE TYPE**<a id="c_type"></a><p />
**DOMAIN**<a id="domain"></a><p />
**Range Types**<a id="range"></a><p />


```sql
SELECT 'teste';
```

