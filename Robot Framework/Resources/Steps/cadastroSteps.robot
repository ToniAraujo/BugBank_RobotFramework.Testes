*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/Variables/cadastroVariables.robot

*** Keywords ***

##CT001
Dado que o usuário esteja na página de cadastro
    
Quando o usuário preencher os campos de cadastro com dados válidos
    
E clicar no botão "Cadastrar"
    
Então o cadastro deve ser realizado com sucesso
    
E o usuário deve ser redirecionado para a página de login