# Projeto Medic
Para a execução do Medic, são necessárias as seguintes configurações:

#####Banco de dados: 
Medic usa o banco de dados MySQL para armazenamento das informações e as seguintes configurações são necessária para o funcionamento da aplicação:
- Criar um novo schema no banco de dados:
    - schema: medic;
- Criar um novo usuário no banco de dados:
    - usuário: medic
    - senha: medic
- Configurar os privilégios de acesso ao schema medic para o usuário medic.
    
#####Desenvolvimento:
Medic foi desenvolvido usando a IDE [GGTS]. Basta fazer o download da IDE, descompactá-la, executá-la e importar o projeto como Grails Project para o seu workspace.

#####Execução:
Uma vez importado o projeto na IDE [GGTS], basta clicar com o botão direito do mouse sobre o projeto e executar o comando de execução: Run As ▸ Grails Command (run-app). 

OBS: Caso já tenha o [GRAILS] instalado e configurado, não é necessário a IDE, basta entrar na pasta do projeto e digitar o seguinte comando no terminal:
- grails run-app

Agora basta aguardar o carregamento da aplicação e acessá-la clicando [aqui].

[GGTS]:http://spring.io/tools/ggts/all
[GRAILS]:https://grails.org/download.html
[aqui]:http://localhost:8080/medic/