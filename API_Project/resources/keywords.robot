*** Settings ***
Documentation    Documentação da API: Github
Library          RequestsLibrary
Library          Collections
Library          OperatingSystem
Library          String
Library          JSONLibrary
Library          FakerLibrary
Library          DateTime
Library          RequestsLibrary
Resource         ../resources/authentication.robot




*** Keywords ***
Efetuar consulta via API
    ${false}=        Convert To Boolean    False
    ${Randomic_correlationID}              Uuid 4


###################### HEADERS ####################################
    ${HEADERS}=    Create Dictionary        Authorization=${ACCESS_TOKEN}
    ...                                     x-apigateway-api-id=${x-apigateway-api-id}
    ...                                     x-apikey=${x-apikey}
    ...                                     x-correlationID=${Randomic_correlationID}
    ...                                     Content-Type=${application/json}


####################### BODY ############################################   
    ${json}        Load Json From File    ../resources/data/input/massa_de_teste.json
    ${randomic_datainicio}    Get Current Date    UTC    -30 days +3 hours
    ${json_object}    Update Value To Json    ${json}    $..data_inicio    ${randomic_datainicio}
    ${randomic_data_vencimento}    Get Current Date    UTC    +365 days -3 hours
    ${json_updated}    Update Value To Json    ${json_object}    $..data_vencimento    ${randomic_data_vencimento}

    Log    ${json_updated}


############################### Criação da Sessão ####################################
    Create Session    oauth    ${URL_CONSULTA_API}        disable_warnings=true    verify=${false}    headers=${HEADERS}
    Set Test Variable    ${HEADERS}


############################## GET da Requisição #####################################
    ${resp}    GET On Session    oauth    ${URL_CONSULTA_API}/cliente
    ...                                   json=${json_updated}
    ...                                   expected_status=200
    Set Test Variable    ${resp}
    Log    ${resp.headers}
    Log    ${resp.content}
    Log To Console    ${resp.status_code}


############################# ASSERTIVA DO CASO DE TESTE ###############################

    Log            ${resp.json()[0]['nome']}
    Log            ${resp.json()[0]['idade']}
    ${resp}    Evaluate    ${resp.json()[0]['nome']}    
    ${resp}    Evaluate    ${resp.json()[0]['idade']} > 30
    Should Be Equal    True    ${resp} 




Efetuar cadastro via API
    ${false}=        Convert To Boolean    False
    ${Randomic_correlationID}              Uuid 4


###################### HEADERS ####################################
    ${HEADERS}=    Create Dictionary        Authorization=${ACCESS_TOKEN}
    ...                                     x-apigateway-api-id=${x-apigateway-api-id}
    ...                                     x-apikey=${x-apikey}
    ...                                     x-correlationID=${Randomic_correlationID}
    ...                                     Content-Type=${application/json}


####################### BODY ############################################   
    ${json}        Load Json From File    ../resources/data/input/massa_de_teste.json
    ${randomic_data_inicio}    Get Current Date    UTC    -30 days +3 hours
    ${json_object}    Update Value To Json    ${json}    $..data_inicio    ${randomic_data_inicio}
    ${randomic_data_vencimento}    Get Current Date    UTC    +365 days -3 hours
    ${json_updated}    Update Value To Json    ${json_object}    $..data_vencimento    ${randomic_data_vencimento}

    Log    ${json_updated}


############################### Criação da Sessão ####################################
    Create Session    oauth    ${URL_CONSULTA_API}        disable_warnings=true    verify=${false}    headers=${HEADERS}
    Set Test Variable    ${HEADERS}


############################## POST da Requisição #####################################
    ${resp}    POST On Session    oauth    ${URL_CONSULTA_API}/cadastrarNovoCliente
    ...                                   json=${json_updated}
    ...                                   expected_status=200
    Set Test Variable    ${resp}
    Log    ${resp.headers}
    Log    ${resp.content}
    Log To Console    ${resp.status_code}


############################# ASSERTIVA DO CASO DE TESTE ###############################

    Log            ${resp.json()[0]['nome']}
    Log            ${resp.json()[0]['idade']}
    ${resp}    Evaluate    ${resp.json()[0]['nome']}    
    ${resp}    Evaluate    ${resp.json()[0]['idade']} > 30
    Should Be Equal    True    ${resp} 

