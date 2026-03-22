# BugBank_RobotFramework.Testes

[![.github/workflows/robot-tests.yml](https://github.com/ToniAraujo/BugBank_RobotFramework.Testes/actions/workflows/robot-tests.yml/badge.svg)](https://github.com/ToniAraujo/BugBank_RobotFramework.Testes/actions/workflows/robot-tests.yml)

Projeto com Robot Framework testando o site Bug Bank

## Estrutura do Projeto
- 📁 robot-framework/
  - 📁 Resources/
    - 📁 Variables/
    - 📁 Steps/
  - 📁 tests/
    - 📄 cadastro.robot
    - 📄 login.robot
    - 📄 transferencia.robot
- 📁 install/
  - 📄 install_dependencies.sh (Linux/Mac)
  - 📄 install_dependencies.bat (Windows)
  - 📄 .gitkeep
- 📄 requirements.txt
- 📄 CI_CD_SETUP.md
- 📁 .github/workflows/

## 🚀 Instalação Rápida

### Windows
```bash
# Execute o script de instalação
install\install_dependencies.bat
```

### Linux/Mac
```bash
# Execute o script de instalação
chmod +x install/install_dependencies.sh
./install/install_dependencies.sh
```

### Instalação Manual

1. **Criar ambiente virtual** (recomendado):
   ```bash
   python -m venv .venv
   ```

2. **Ativar ambiente virtual**:
   - Windows: `.venv\Scripts\activate`
   - Linux/Mac: `source .venv/bin/activate`

3. **Instalar dependências**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Verificar instalação**:
   ```bash
   python -c "import robot; print(f'Robot Framework: {robot.__version__}')"
   webdriver-manager update chromedriver
   ```

## ▶️ Executando os Testes

### Desenvolvimento (Local)
```bash
python -m robot -d results "robot-framework/tests"
```

### CI/CD (GitHub Actions)
Os testes são executados automaticamente via workflow `.github/workflows/robot-tests.yml` em pushes e pull requests para a branch `main`.

## 📊 Resultados dos Testes

Após a execução, os relatórios ficam em `results/`:
- `report.html` - Relatório visual
- `log.html` - Log detalhado
- `output.xml` - Resultados em XML

## 🛠️ Tecnologias Utilizadas

- **Robot Framework** 6.1.1 - Framework de automação de testes
- **SeleniumLibrary** 6.2.0 - Biblioteca para testes web
- **Selenium** 4.15.2 - WebDriver para automação
- **webdriver-manager** 4.0.1 - Gerenciamento automático do ChromeDriver
- **Chrome/Chromium** - Navegador para execução dos testes

## 📋 Pré-requisitos

- Python 3.8+
- Google Chrome ou Chromium
- Git (para controle de versão)


Passo a passo 🖥️
- Baixar o instalador oficial
- Acesse python.org e vá até a seção Downloads.
- O site detecta automaticamente seu sistema e sugere a versão mais recente do Python para Windows.
- Executar o instalador
- Clique no arquivo baixado (.exe).
- Na tela inicial, marque a opção "Add Python to PATH" (isso facilita usar o Python no terminal).
- Clique em "Install Now".
- Finalizar instalação
- Aguarde o processo terminar e clique em Close.
- Verificar se deu certo
- Abra o Prompt de Comando (pesquise por cmd no menu iniciar).
- Digite:
python --version

