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
    [Tags]    teste api
    Efetuar consulta via API
    # Dado que eu tenha uma API
    # E que esteja com as devidas credenciais
    # Quando realizar uma consulta GET na API
    # Então a API deve me retornar as informações
