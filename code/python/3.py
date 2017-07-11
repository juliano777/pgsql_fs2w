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
