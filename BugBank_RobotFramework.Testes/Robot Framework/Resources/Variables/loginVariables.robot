*** Variables ***

${LOGIN URL}                      https://bugbank.netlify.app/
${BROWSER}                        Chrome

${BOTAO_ACESSAR}                  xpath=/html/body/div[1]/div/div[2]/div/div[1]/form/div[3]/button[1]
${CAMPO_MSG_EMAIL_OBRIGATORIO}    xpath=/html/body/div[1]/div/div[2]/div/div[1]/form/div[1]/p
${CAMPO_MSG_SENHA_OBRIGATORIA}    xpath=/html/body/div[1]/div/div[2]/div/div[1]/form/div[2]/div/p
${CAMPO_EMAIL}                    xpath=/html/body/div[1]/div/div[2]/div/div[1]/form/div[1]/input
${CAMPO_SENHA}                    xpath=/html/body/div[1]/div/div[2]/div/div[1]/form/div[2]/div/input


${EMAIL_VALIDO}                   email_teste@uorak.com
${SENHA_VALIDA}                   eumesmo123
${EMAIL_NAO_CADASTRADO}           email_nao_cadastrado@uorak.com
${SENHA_INCORRETA}                senha_incorreta123

${LOCAL_USUARIO_NAO_CADASTRADO}   xpath=//*[@id="modalText"]
${USUARIO_NAO_CADASTRADO}         Usuário ou senha inválido.

${BOAS_VINDAS}                    xpath=/html/body/div[1]/div/div[2]/div/div[2]/p[2]
${TEXTO_BOAS_VINDAS}              bem vindo ao BugBank
