#!/bin/bash
# Script para instalar e verificar dependências do projeto Robot Framework

echo "=== Instalando dependências do projeto Robot Framework ==="

# Verificar se Python está instalado
if ! command -v python &> /dev/null; then
    echo "❌ Python não encontrado. Instale Python 3.8+ primeiro."
    exit 1
fi

echo "✅ Python encontrado: $(python --version)"

# Criar ambiente virtual se não existir
if [ ! -d ".venv" ]; then
    echo "📦 Criando ambiente virtual..."
    python -m venv .venv
fi

# Ativar ambiente virtual
echo "🔄 Ativando ambiente virtual..."
source .venv/bin/activate  # Para Linux/Mac
# Para Windows, use: .venv\Scripts\activate

# Instalar dependências
echo "📥 Instalando dependências..."
pip install --upgrade pip
pip install -r requirements.txt

# Verificar instalação
echo "🔍 Verificando instalação..."

echo "Robot Framework:"
python -c "import robot; print(f'  ✅ Versão: {robot.__version__}')" 2>/dev/null || echo "  ❌ Falhou"

echo "SeleniumLibrary:"
python -c "import SeleniumLibrary; print('  ✅ OK')" 2>/dev/null || echo "  ❌ Falhou"

echo "webdriver-manager:"
python -c "import webdriver_manager; print('  ✅ OK')" 2>/dev/null || echo "  ❌ Falhou"

echo "Selenium:"
python -c "import selenium; print(f'  ✅ Versão: {selenium.__version__}')" 2>/dev/null || echo "  ❌ Falhou"

# Verificar ChromeDriver
echo "ChromeDriver:"
if command -v webdriver-manager &> /dev/null; then
    webdriver-manager update chromedriver > /dev/null 2>&1
    if command -v chromedriver &> /dev/null; then
        echo "  ✅ $(chromedriver --version | head -1)"
    else
        echo "  ❌ Não encontrado"
    fi
else
    echo "  ❌ webdriver-manager não encontrado"
fi

echo ""
echo "=== Instalação concluída ==="
echo "Para ativar o ambiente virtual em futuras sessões:"
echo "  source .venv/bin/activate  # Linux/Mac"
echo "  # ou .venv\Scripts\activate  # Windows"
echo ""
echo "Para executar os testes:"
echo "  python -m robot -d results \"robot-framework/tests\""