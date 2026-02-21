*** Settings ***
Documentation     Teste exemplo Robot Framework.
Library           SeleniumLibrary
Test Teardown     Close Browser
Resource          Resources/Variables/HomePage.robot




*** Test Cases ***
CT001: Validar botão "Estou com Sorte" Google
    [Documentation]    Página inicial
    Abrir Navegador na página Google
    Clicando no Botão Estou com Sorte
    #[Teardown]    Close Browser

*** Keywords ***
Abrir Navegador na página Google
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Google
    Maximize Browser Window


Clicando no Botão Estou com Sorte
    Wait Until Element Is Visible    ${NAO_ACEITAR}    timeout=5s
    Click Element                    ${NAO_ACEITAR}
    Wait Until Element Is Visible    ${BOTAO_ESTOU_COM_SORTE}                timeout=5s
    Click Element                    ${BOTAO_ESTOU_COM_SORTE}
    Sleep    2s
    Scroll Element Into View         ${BOTAO_SCROLL}
                                             