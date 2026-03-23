*** Settings ***
Library    SeleniumLibrary
Resource   ../../Resources/Variables/cadastroVariables.robot

*** Keywords ***

##CT001
Dado que o usuário esteja na página de cadastro
    Wait Until Element Is Visible     ${BOTAO_REGISTRAR}  timeout=5s
    Scroll Element Into View          ${BOTAO_REGISTRAR}
    Click Button    ${BOTAO_REGISTRAR}
    
    
Quando o usuário tentar cadastrar sem preencher o campo "Nome"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Input Text   ${CAMPO_EMAIL_CADASTRO}    dsadsad@dsads.com  
    Input Text   ${CAMPO_SENHA_CADASTRO}    eumesmo123         
    Input Text   ${CAMPO_CONFIRMAR_SENHA}    eumesmo123         
    Click Button    ${BOTAO_CADASTRAR}
   
Então o sistema deve exibir a mensagem "Nome não pode ser vazio"
    Wait Until Element Is Visible  ${LOCAL_TEXTO_MODAL}  timeout=5s
    Element Should Contain  ${LOCAL_TEXTO_MODAL}  Nome não pode ser vazio

##CT002
Quando o usuário tentar cadastrar sem preencher o campo "Email"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Input Text   ${CAMPO_NOME}              Teste Automação
    Input Text   ${CAMPO_SENHA_CADASTRO}    eumesmo123         
    Input Text   ${CAMPO_CONFIRMAR_SENHA}    eumesmo123         
    Click Button    ${BOTAO_CADASTRAR}

Então o sistema deve exibir a mensagem "Email não pode ser vazio"
    Wait Until Element Is Visible  ${LOCAL_TEXTO_EMAIL}   timeout=5s
    Element Should Contain         ${LOCAL_TEXTO_EMAIL}  É campo obrigatório

##CT003
Quando o usuário tentar cadastrar sem preencher o campo "Senha"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Input Text   ${CAMPO_NOME}              Teste Automação
    Input Text   ${CAMPO_EMAIL_CADASTRO}    dsadsad@dsads.com  
    Input Text   ${CAMPO_CONFIRMAR_SENHA}    eumesmo123
    Click Button    ${BOTAO_CADASTRAR}

Então o sistema deve exibir a mensagem "Senha não pode ser vazio"
    Wait Until Element Is Visible  ${LOCAL_TEXTO_SENHA}   timeout=5s
    Element Should Contain         ${LOCAL_TEXTO_SENHA}  É campo obrigatório

##CT004
Quando o usuário tentar cadastrar sem preencher o campo "Confirmação de senha"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Input Text   ${CAMPO_NOME}              Teste Automação
    Input Text   ${CAMPO_EMAIL_CADASTRO}    dsadsad@dsads.com  
    Input Text   ${CAMPO_SENHA_CADASTRO}    eumesmo123         
    Click Button    ${BOTAO_CADASTRAR}

Então o sistema deve exibir a mensagem "Confirmação de senha não pode ser vazio"
    Wait Until Element Is Visible  ${LOCAL_TEXTO_CONFIRMAR_SENHA}   timeout=5s
    Element Should Contain         ${LOCAL_TEXTO_CONFIRMAR_SENHA}  É campo obrigatório

##CT005
E que o usuário ative a opção "Criar conta com saldo"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Execute JavaScript    document.getElementById("toggleAddBalance").click()  
    
    
    
Quando o usuário preencher Nome, Email, Senha e Confirmação de senha corretamente
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Input Text   ${CAMPO_NOME}               Teste Automação
    Input Text   ${CAMPO_EMAIL_CADASTRO}    email_teste@uorak.com 
    Input Text   ${CAMPO_SENHA_CADASTRO}    eumesmo123         
    Input Text   ${CAMPO_CONFIRMAR_SENHA}    eumesmo123         
    
    
E confirmar o cadastro
    Scroll Element Into View    ${BOTAO_CADASTRAR}
    Click Button                ${BOTAO_CADASTRAR}
    
    
Então o sistema deve criar a conta com saldo de R$ 1.000,00
    Wait Until Element Is Visible  ${LOCAL_TEXTO_MODAL}  timeout=5s
    Element Should Contain  ${LOCAL_TEXTO_MODAL}  criada com sucesso

Criação de conta com saldo de R$ 1.000,00
    E que o usuário ative a opção "Criar conta com saldo"
    Quando o usuário preencher Nome, Email, Senha e Confirmação de senha corretamente
    E confirmar o cadastro
    Wait Until Element Is Visible  ${LOCAL_TEXTO_MODAL}  timeout=5s
    Element Should Contain  ${LOCAL_TEXTO_MODAL}  criada com sucesso
    Wait Until Element Is Visible  xpath=/html/body/div[1]/div/div[3]/div/div[1]/a     timeout=5s
    Scroll Element Into View       xpath=/html/body/div[1]/div/div[3]/div/div[1]/a
    Click Element                  xpath=/html/body/div[1]/div/div[3]/div/div[1]/a
    
##CT006
E que o usuário deixe inativa a opção "Criar conta com saldo"
    Wait Until Element Is Visible  ${BOTAO_CADASTRAR}  timeout=5s
    Quando o usuário preencher Nome, Email, Senha e Confirmação de senha corretamente
        
Então o sistema deve criar a conta com saldo de R$ 0,00
    Wait Until Element Is Visible  ${LOCAL_TEXTO_MODAL}  timeout=5s
    Element Should Contain  ${LOCAL_TEXTO_MODAL}  criada com sucesso
    Wait Until Element Is Visible  xpath=/html/body/div[1]/div/div[3]/div/div[1]/a     timeout=5s
    Click Element    xpath=/html/body/div[1]/div/div[3]/div/div[1]/a
    
