*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser 
Resource          ../Resources/Steps/loginSteps.robot
Resource          ../Resources/Steps/transferenciaSteps.robot


*** Test Cases ***
CT001 – Transferência para conta inválida
    [Documentation]    Tentar realizar uma transferência para uma conta que não existe
    Dado que o usuário esteja na página de transferência
    Quando o usuário preencher os campos de transferência com uma conta de destino inválida
    E confirmar a transferência
    Então o sistema deve exibir uma mensagem de erro indicando que a conta de destino é inválida
    
    
    