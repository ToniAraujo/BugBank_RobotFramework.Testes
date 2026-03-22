@echo off
REM Script para instalar e verificar dependências do projeto Robot Framework (Windows)

echo === Instalando dependências do projeto Robot Framework ===

REM Verificar se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python não encontrado. Instale Python 3.8+ primeiro.
    pause
    exit /b 1
)

echo ✅ Python encontrado: 
python --version

REM Criar ambiente virtual se não existir
if not exist ".venv" (
    echo 📦 Criando ambiente virtual...
    python -m venv .venv
)

REM Ativar ambiente virtual
echo 🔄 Ativando ambiente virtual...
call .venv\Scripts\activate

REM Instalar dependências
echo 📥 Instalando dependências...
python -m pip install --upgrade pip
pip install -r requirements.txt

REM Verificar instalação
echo 🔍 Verificando instalação...

echo Robot Framework:
python -c "import robot; print(f'  ✅ Versão: {robot.__version__}')" 2>nul
if %errorlevel% neq 0 echo   ❌ Falhou

echo SeleniumLibrary:
python -c "import SeleniumLibrary; print('  ✅ OK')" 2>nul
if %errorlevel% neq 0 echo   ❌ Falhou

echo webdriver-manager:
python -c "import webdriver_manager; print('  ✅ OK')" 2>nul
if %errorlevel% neq 0 echo   ❌ Falhou

echo Selenium:
python -c "import selenium; print(f'  ✅ Versão: {selenium.__version__}')" 2>nul
if %errorlevel% neq 0 echo   ❌ Falhou

REM Verificar ChromeDriver
echo ChromeDriver:
webdriver-manager update chromedriver >nul 2>&1
chromedriver --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('chromedriver --version') do echo   ✅ %%i
) else (
    echo   ❌ Não encontrado
)

echo.
echo === Instalação concluída ===
echo Para ativar o ambiente virtual em futuras sessões:
echo   .venv\Scripts\activate
echo.
echo Para executar os testes:
echo   python -m robot -d results "robot-framework/tests"
echo.
pause