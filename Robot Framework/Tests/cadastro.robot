*** Settings ***
Documentation     Teste exemplo Robot Framework.
Library           SeleniumLibrary
Test Teardown     Close Browser
Resource          ../Resources/Steps/loginSteps.robot

*** Test Cases ***

CT09 – Cadastro válido
    [Documentation]     Realizar cadastro com dados válidos.
    Dado que o usuário esteja na página de cadastro
    Quando o usuário preencher os campos de cadastro com dados válidos
    E clicar no botão "Cadastrar"
    Então o cadastro deve ser realizado com sucesso
    E o usuário deve ser redirecionado para a página de login