*** Settings ***
Library    SeleniumLibrary
Resource      ../Variables/transferenciaVariables.robot



*** Keywords ***

Dado que o usuário esteja na página de transferência
    Wait Until Element Is Visible   ${BOTAO_TRANSFERENCIA}    timeout=5s
    Execute JavaScript    document.getElementById("btn-TRANSFERÊNCIA").click()
    Sleep    1s
    Location Should Contain    /transfer


Quando o usuário preencher os campos de transferência com uma conta de destino inválida
    Input Text    ${CAMPO_CONTA_DESTINO}    1234
    Input Text    ${CAMPO_AGENCIA_DESTINO}   01
    Input Text    ${CAMPO_VALOR_TRANSFERENCIA}   100
    Input Text    ${CAMPO_DESCRICAO_TRANSFERENCIA}   Teste transferência conta inválida

E confirmar a transferência
    Click Element   ${BOTAO_TRANSFERIR}

Então o sistema deve exibir uma mensagem de erro indicando que a conta de destino é inválida
    Wait Until Element Is Visible   ${LOCAL_TEXTO_MODAL}  timeout=5s
    Element Should Contain          ${LOCAL_TEXTO_MODAL}      Conta inválida ou inexistente

