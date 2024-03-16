*** Settings ***
Library    SeleniumLibrary



*** Keywords ***
Quando eu abrir o site da Amazon
    Go To    url=${URLEmail}

E clicar no campo de pesquisa
    Wait Until Element Is Visible    locator=${campodePesquisa}
    Click Element                    locator=${campodePesquisa}

E digitar ${PRODUTO}
    Input Text    locator=${campodePesquisa}    text=${PRODUTO}


E clicar em pesquisar
    Click Element    locator=${botaodePesquisa}

