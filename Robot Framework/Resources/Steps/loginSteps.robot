*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/Variables/loginVariables.robot


*** Keywords ***


##CT001
Dado que o usuário esteja na página de login
    Open Browser                ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window


Quando o usuário clicar no botão "Acessar" sem preencher os campos de email e senha
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s
    E clicar no botão "Acessar"


Então o sistema deve exibir uma mensagem de erro indicando que os campos de email e senha são obrigatórios
    Element Should Be Visible    ${CAMPO_MSG_EMAIL_OBRIGATORIO}    timeout=5s
    Element Text Should Be       ${CAMPO_MSG_EMAIL_OBRIGATORIO}    É campo obrigatório
    Element Should Be Visible    ${CAMPO_MSG_SENHA_OBRIGATORIA}    timeout=5s
    Element Text Should Be       ${CAMPO_MSG_SENHA_OBRIGATORIA}    É campo obrigatório

##CT002
Quando o usuário clicar no botão "Acessar" sem preencher o campo de email
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s    
    Input Text                      ${CAMPO_SENHA}       ${SENHA_VALIDA}
    E clicar no botão "Acessar"

Então o sistema deve exibir uma mensagem de erro indicando que o campo de email é obrigatório
    Wait Until Element Is Visible    ${CAMPO_MSG_EMAIL_OBRIGATORIO}    timeout=5s
    Element Text Should Be           ${CAMPO_MSG_EMAIL_OBRIGATORIO}    É campo obrigatório

##CT003
Quando o usuário clicar no botão "Acessar" sem preencher o campo de senha
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s
    Input Text                      ${CAMPO_EMAIL}    ${EMAIL_VALIDO}
    E clicar no botão "Acessar"

Então o sistema deve exibir uma mensagem de erro indicando que o campo de senha é obrigatório
    Wait Until Element Is Visible    ${CAMPO_MSG_SENHA_OBRIGATORIA}    timeout=5s
    Element Text Should Be           ${CAMPO_MSG_SENHA_OBRIGATORIA}    É campo obrigatório    

##CT004
Quando o usuário preencher o campo de email com um endereço de email não cadastrado e clicar no botão "Acessar"
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s
    Input Text                      ${CAMPO_EMAIL}    ${EMAIL_NAO_CADASTRADO}
    Input Text                      ${CAMPO_SENHA}    ${SENHA_VALIDA}
    E clicar no botão "Acessar"

Então o sistema deve exibir uma mensagem de erro indicando que o email não está cadastrado
    Wait Until Element Is Visible   ${LOCAL_USUARIO_NAO_CADASTRADO}    timeout=5s
    Element Should Contain          ${LOCAL_USUARIO_NAO_CADASTRADO}   ${USUARIO_NAO_CADASTRADO}

##CT005
Quando o usuário preencher o campo de email cadastrado e o campo de senha com uma senha incorreta
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s
    Input Text                      ${CAMPO_EMAIL}    ${EMAIL_VALIDO}
    Input Text                      ${CAMPO_SENHA}    ${SENHA_INCORRETA}
    

E clicar no botão "Acessar"
    Wait Until Element Is Visible   ${BOTAO_ACESSAR}    timeout=5s
    Click Button                    ${BOTAO_ACESSAR}

Então o sistema deve exibir uma mensagem de erro indicando que a senha está incorreta
    Wait Until Element Is Visible   ${LOCAL_USUARIO_NAO_CADASTRADO}    timeout=5s
    Element Should Contain          ${LOCAL_USUARIO_NAO_CADASTRADO}   ${USUARIO_NAO_CADASTRADO}

##CT006
Quando o usuário preencher o email válido, deixa senha vazia e clicar no botão "Acessar"
    Wait Until Element Is Visible   ${CAMPO_EMAIL}   timeout=5s
    Input Text                      ${CAMPO_EMAIL}    ${EMAIL_VALIDO}
    Input Text                      ${CAMPO_SENHA}    ${SPACE} 
    E clicar no botão "Acessar"


##CT007
Quando o usuário preencher o campo de email e senha com credenciais corretas
    Wait Until Element Is Visible   ${CAMPO_EMAIL}   timeout=5s
    Input Text                      ${CAMPO_EMAIL}    ${EMAIL_VALIDO}
    Input Text                      ${CAMPO_SENHA}    ${SENHA_VALIDA}
    SLEEP    20S
    E clicar no botão "Acessar"

Então o sistema deve redirecionar para a página principal do usuário
    Wait Until Element Is Visible    ${BOAS_VINDAS}   timeout=5s
    Element Should Contain          ${BOAS_VINDAS}   ${TEXTO_BOAS_VINDAS}

                                             