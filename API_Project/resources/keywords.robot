*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         String
Library         JSONLibrary
Library         DatabaseLibrary
Library         FakerLibrary
Resource        ../resources/authentication.robot




*** Keywords ***
Consultar API
    ${false}=        Convert To Boolean        False
######################## HEADERS #################################
    ${HEADERS}=      Create Dictionary        Authorization=${ACCESS_TOKEN_PRATELEIRA}
    ...                                       apikey=${apikey}
    ...                                       correlationID=${correlationID}
    ...                                       Content-Type=${application/json}
