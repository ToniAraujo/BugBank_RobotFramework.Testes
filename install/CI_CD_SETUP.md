# Configuração para Execução em CI/CD (GitHub Actions)

## Executar Testes em Modo Headless

Para adaptar os testes para um ambiente de CI/CD onde não há interface gráfica, siga as instruções abaixo:

### Opção 1: Modificar Variáveis (Recomendado)

1. Abra o arquivo `robot-framework/Resources/Variables/loginVariables.robot`

2. Comente a linha atual:
   ```robot
   ${CHROME_OPTIONS}                
   ```

3. Descomente a linha de headless:
   ```robot
   ${CHROME_OPTIONS}                add_argument("--headless=new");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--window-size=1920,1080");add_argument("--disable-gpu")
   ```

### Opção 2: Usar Variável de Ambiente

Modifique seu script GitHub Actions para passar a variável:

```yaml
- name: Run Robot Framework Tests
  run: |
    python -m robot -d results \
    --variable CHROME_OPTIONS:"add_argument(\"--headless=new\");add_argument(\"--no-sandbox\");add_argument(\"--disable-dev-shm-usage\");add_argument(\"--window-size=1920,1080\")" \
    "robot-framework/tests"
```

### Opção 3: Comando Manual

```bash
python -m robot -d results -v CHROME_OPTIONS:"add_argument(\"--headless=new\")" "robot-framework/tests"
```

## Configurações Chrome Recomendadas para CI/CD

| Argumento | Descrição |
|-----------|-----------|
| `--headless=new` | Ativa modo headless (versão mais recente do Chrome) |
| `--no-sandbox` | Desabilita sandbox do Chrome (necessário em containers) |
| `--disable-dev-shm-usage` | Resolve problemas de memória em ambientes Linux |
| `--window-size=1920,1080` | Define tamanho da janela (importante para headless) |
| `--disable-gpu` | Desabilita aceleração GPU |

## Estrutura do Comando de Execução

### Desenvolvimento (Local)
```bash
python -m robot -d results "robot-framework/tests"
```

### CI/CD (GitHub Actions)
```bash
python -m robot -d results \
  -v CHROME_OPTIONS:"add_argument(\"--headless=new\");add_argument(\"--no-sandbox\");add_argument(\"--disable-dev-shm-usage\");add_argument(\"--window-size=1920,1080\")" \
  "robot-framework/tests"
```

## Arquivo .github/workflows/test.yml Exemplo

```yaml
name: Robot Framework Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install robotframework seleniumlibrary
    
    - name: Download ChromeDriver
      run: |
        # Você pode usar webdriver-manager ou outro método
        pip install webdriver-manager
    
    - name: Run Robot Framework Tests
      run: |
        python -m robot -d results \
          -v CHROME_OPTIONS:"add_argument(\"--headless=new\");add_argument(\"--no-sandbox\");add_argument(\"--disable-dev-shm-usage\");add_argument(\"--window-size=1920,1080\")" \
          "robot-framework/tests"
    
    - name: Upload Test Results
      if: always()
      uses: actions/upload-artifact@v3
      with:
        name: robot-results
        path: results/
```

## Dependências do Projeto

### Arquivo `requirements.txt`

As dependências necessárias estão listadas no arquivo `requirements.txt`:

```
# Dependências para testes Robot Framework com Selenium
robotframework==6.1.1
robotframework-seleniumlibrary==6.2.0
webdriver-manager==4.0.1

# Dependências adicionais para CI/CD
selenium==4.15.2
```

### Instalação Local

Para instalar as dependências localmente:

```bash
# Criar ambiente virtual (recomendado)
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
# ou .venv\Scripts\activate  # Windows

# Instalar dependências
pip install -r requirements.txt
```

### Verificação da Instalação

Após a instalação, verifique se tudo está funcionando:

```bash
# Verificar versões
python -c "import robot; print(f'Robot Framework: {robot.__version__}')"
python -c "import SeleniumLibrary; print('SeleniumLibrary: OK')"
python -c "import webdriver_manager; print('webdriver-manager: OK')"

# Verificar ChromeDriver
webdriver-manager update chromedriver
chromedriver --version
```

## Troubleshooting

### Problema: "Element click intercepted" em headless
**Solução:** Aumente os timeouts nos steps ou adicione waits explícitos:
```robot
Wait Until Element Is Visible    ${ELEMENTO}    timeout=10s
```

### Problema: Problemas de rendering em headless
**Solução:** Mantenha `--window-size=1920,1080` e evite `Maximize Browser Window` em headless

### Problema: ChromeDriver não encontrado
**Solução:** Instale webdriver-manager:
```bash
pip install webdriver-manager
```
```

## Melhorias Implementadas

Os testes foram configurados para:

✅ **Aceitar opções de browser dinamicamente** - As variáveis `${BROWSER}` e `${CHROME_OPTIONS}` permitem fácil alternância entre modo normal e headless

✅ **Usar estrutura uniforme** - Todos os arquivos de teste utilizam as mesmas variáveis

✅ **Saída centralizada** - Os resultados são sempre salvos na pasta `results/`

## Troubleshooting

### Problema: "Element click intercepted" em headless
**Solução:** Aumente os timeouts nos steps ou adicione waits explícitos:
```robot
Wait Until Element Is Visible    ${ELEMENTO}    timeout=10s
```

### Problema: Problemas de rendering em headless
**Solução:** Mantenha `--window-size=1920,1080` e evite `Maximize Browser Window` em headless

### Problema: ChromeDriver não encontrado
**Solução:** Instale webdriver-manager:
```bash
pip install webdriver-manager
```

## Monitoramento de Testes

Após a execução, consulte:
- **Log detalhado:** `results/log.html`
- **Report visual:** `results/report.html`
- **Output XML:** `results/output.xml` (para integração com ferramentas)
