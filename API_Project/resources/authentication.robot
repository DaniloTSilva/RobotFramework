*** Settings ***
Documentation     Documentação da API: Github
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem
Resource          ../resources/keywords.robot


*** Variables ***
${ACCESS_TOKEN}


*** Keywords ***
Efetuar autenticação Bearer token
    ${false}=    Convert To Boolean    False 

############################### HEADERS ##########################
    ${HEADERS}=        Create Dictionary        Content-Type=application/x-www-form-urlencoded        Accept=application/json


############################## BODY ##################################
    ${BODY}=           Create Dictionary    grant_type=${grantType}    client_id=${client_id}    client_secret=${client_secret}


########################### Criação da Sessão ######################
    Create Session    oauth    ${AUTHENTICATION}
    ...                        disable_warnings=1
    ...                        verify=${false}
    ...                        headers=${HEADERS}
    

########################### POST da Requisição ##########################
    ${RESPOSTA}    POST On Session    oauth    ${AUTHENTICATION}/oauth/token 
    ...                                        data=${BODY}
    ...                                        expected_status=200
    
    Set Suite Variable            ${ACCESS_TOKEN}
    ...                           Bearer ${RESPOSTA.json()['access_token']}
    
    Log    ${RESPOSTA.json}

