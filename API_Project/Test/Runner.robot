*** Settings ***

Documentation    Teste de uma API Pública
Library          RequestsLibrary
Library          Collections
Library          OperatingSystem
Library          String
Resource         ../resources/authentication.robot
Resource         ../resources/keywords.robot
# Test Setup       Efetuar autenticação Bearer token



*** Test Cases ***
CT01 - Consultar API
    [Tags]    Consultar API
    Consultar API
    #Dado que eu queira consultar uma API
    #Quando eu consultar a url da API
    #Então eu irei receber o response da API
    
