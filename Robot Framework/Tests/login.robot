*** Settings ***
Documentation     Teste exemplo Robot Framework.
Library           SeleniumLibrary
Test Teardown     Close Browser
Resource          Resources/Steps/loginSteps.robot




*** Test Cases ***

CT01 – Login sem preencher email e senha
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário clicar no botão "Acessar" sem preencher os campos de email e senha
    Então o sistema deve exibir uma mensagem de erro indicando que os campos de email e senha são obrigatórios
    
CT02 – Login sem preencher apenas email
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário clicar no botão "Acessar" sem preencher o campo de email
    Então o sistema deve exibir uma mensagem de erro indicando que o campo de email é obrigatório

CT03 – Login sem preencher apenas senha   
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário clicar no botão "Acessar" sem preencher o campo de senha
    Então o sistema deve exibir uma mensagem de erro indicando que o campo de senha é obrigatório

CT04 – Login com email não cadastrado
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário preencher o campo de email com um endereço de email não cadastrado e clicar no botão "Acessar"
    Então o sistema deve exibir uma mensagem de erro indicando que o email não está cadastrado

CT05 – Login com senha incorreta
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário preencher o campo de email cadastrado e o campo de senha com uma senha incorreta
    E clicar no botão "Acessar"
    Então o sistema deve exibir uma mensagem de erro indicando que a senha está incorreta

CT06 – Login com email válido e senha vazia
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário preencher o email válido, deixa senha vazia e clicar no botão "Acessar"
    Então o sistema deve exibir uma mensagem de erro indicando que a senha está incorreta

CT07 – Login com credenciais corretas  
    [Documentation]    Página de Login
    Dado que o usuário esteja na página de login
    Quando o usuário preencher o campo de email e senha com credenciais corretas
    Então o sistema deve redirecionar para a página principal do usuário




