*** Variables ***

${BASE_URL}                      https://bugbank.netlify.app/
${BROWSER}                        chrome

# ========== CONFIGURAÇÃO DO CHROME ==========
# Para desenvolvimento LOCAL (modo interativo com interface):
# ${CHROME_OPTIONS}                

# Para PIPELINE CI/CD (headless no Linux), descomente a linha abaixo:
${CHROME_OPTIONS}                add_argument("--headless=new");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080");add_argument("--disable-gpu")
# ============================================

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
