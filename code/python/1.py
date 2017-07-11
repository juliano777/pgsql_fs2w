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
