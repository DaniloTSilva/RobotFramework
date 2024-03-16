*** Settings ***

Library    SeleniumLibrary



*** Keywords ***
Abrir navegador
    Open Browser        about:blank    ${BROWSER}
    Maximize Browser Window


Fechar o navegador
    Capture Page Screenshot
    Close Browser
