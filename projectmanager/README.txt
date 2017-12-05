### INTEGRANTES ###
Ângelo Lovatto (9293435)
Gabriel Lasso (9298016)
Ricardo Lira (8536131)
Felipe Caetano (9293223)
Camila Naomi (4266602)

### SCRIPTS SQL ###

Todos os arquivos sql foram construídos para uso com o PostgreSQL.
O script 'tables.sql' tem como função criar e popular a base de dados
usando o psql com a opção '-f tables.sql'. Será criado um banco de dados
'felipebanco', que deve ser usado ao executar o script 'usecases.sql',
já que o mesmo depende de instâncias criadas pelo anterior.

### APLICAÇÃO DJANGO ###

O banco de dados 'felipebanco' pode ser usado pela aplicação em Django, basta
configurar o banco de dados no arquivo settings.py de 'projectmanager'. Não deve
ser executado 'python manage.py migrate' nesse caso, pois o banco já estará pronto.

A aplicação pode ser executada usando

$ python manage.py runserver

depois que o banco de dados for preparado por 'tables.sql' ou depois de executar as
migração pelo python

$ python manage.py migrate

