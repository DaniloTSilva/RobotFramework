*** Settings ***

Documentation    Essa automação abre o site da Amazon e pesquisa um produto
Resource         ../Resources/resources.robot
Resource         ../Pages/HomePage.robot
Test Setup       Abrir navegador
Test Teardown    Fechar o navegador


*** Test Cases ***

Caso de Teste 01 - Abrir site da Amazon
    [Documentation]    Esse teste abre o site da Amazon e pesquisa um produto
    [Tags]             Abrir email
    HomePage.Quando eu abrir o site da Amazon
    HomePage.E clicar no campo de pesquisa
    HomePage.E digitar "iPhone 12 128GB"
    HomePage.E clicar em pesquisar
