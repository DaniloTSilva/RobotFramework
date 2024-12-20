*** Settings ***
Documentation       Documentação da API:
...                 \n Projeto de automação de teste para testes de backend de APIs, utilizando o framework de testes Robot framework

Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             String
Resource            ../resources/authentication.robot
Resource            ../resources/keywords.robot
Test Setup         Efetuar autenticação Bearer token


############################## AÇÕES ###################################################


*** Test Cases ***
CT01 - Deve realizar uma consulta via API
    [Tags]    Teste Api
    Efetuar consulta via API
    # Dado que eu tenha uma API
    # E que esteja com as devidas credenciais
    # Quando realizar uma consulta via GET na API
    # Então a API deve me retornar as informações

CT02 - Deve realizar um cadastro de cliente via API
    [Tags]    Teste Api
    Efetuar cadastro via API
    # Dado que eu tenha uma API
    # E que esteja com as devidas credenciais
    # Quando realizar um cadastro via POST na API
    # Então a API deve cadastrar um novo cliente com as informações passadas na requisição
