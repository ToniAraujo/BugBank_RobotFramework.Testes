*** Settings ***
Documentation     Teste exemplo Robot Framework.
Library           SeleniumLibrary
Test Setup        Open Browser    ${BASE_URL}    chrome
Test Teardown     Close All Browsers
Resource          ../Resources/Steps/cadastroSteps.robot


*** Test Cases ***

CT001 – Cadastro sem preencher nome
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    Quando o usuário tentar cadastrar sem preencher o campo "Nome"
    Então o sistema deve exibir a mensagem "Nome não pode ser vazio"

CT002 – Cadastro sem preencher email
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    Quando o usuário tentar cadastrar sem preencher o campo "Email"
    Então o sistema deve exibir a mensagem "Email não pode ser vazio"

CT003 – Cadastro sem preencher senha
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    Quando o usuário tentar cadastrar sem preencher o campo "Senha"
    Então o sistema deve exibir a mensagem "Senha não pode ser vazio"

CT004 – Cadastro sem preencher confirmação de senha
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    Quando o usuário tentar cadastrar sem preencher o campo "Confirmação de senha"
    Então o sistema deve exibir a mensagem "Confirmação de senha não pode ser vazio"

CT005 – Cadastro com opção Criar conta com saldo
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    E que o usuário ative a opção "Criar conta com saldo"
    Quando o usuário preencher Nome, Email, Senha e Confirmação de senha corretamente
    E confirmar o cadastro
    Então o sistema deve criar a conta com saldo de R$ 1.000,00

CT006 – Cadastro com opção Criar conta sem saldo
    [Documentation]    Página de Cadastro
    Dado que o usuário esteja na página de cadastro
    E que o usuário deixe inativa a opção "Criar conta com saldo"
    Quando o usuário preencher Nome, Email, Senha e Confirmação de senha corretamente
    E confirmar o cadastro
    Então o sistema deve criar a conta com saldo de R$ 0,00