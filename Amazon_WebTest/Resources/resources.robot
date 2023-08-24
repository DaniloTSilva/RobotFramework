*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${BROWSER}        firefox



*** Keywords ***
Abrir navegador
    Open Browser        about:blank    ${BROWSER}
    Maximize Browser Window


Fechar o navegador
    Capture Page Screenshot
    Close Browser
