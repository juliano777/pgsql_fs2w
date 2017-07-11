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
