#!/bin/bash

echo "========================================"
echo "   Sistema PDF - Instalador Automático"
echo "========================================"
echo

echo "[1/4] Verificando Python..."
if ! command -v python3 &> /dev/null; then
    echo "ERRO: Python3 não encontrado!"
    echo "Por favor, instale Python 3.8+ primeiro"
    exit 1
fi

python3 --version
echo "Python encontrado! ✓"
echo

echo "[2/4] Verificando pip..."
if ! command -v pip3 &> /dev/null; then
    echo "ERRO: pip3 não encontrado!"
    echo "Instalando pip..."
    python3 -m ensurepip --upgrade
fi

pip3 --version
echo "pip encontrado! ✓"
echo

echo "[3/4] Instalando dependências..."
echo
pip3 install --upgrade pip
pip3 install flask
pip3 install PyMuPDF
pip3 install python-docx
pip3 install werkzeug

if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao instalar dependências!"
    echo "Tentando instalar do requirements.txt..."
    pip3 install -r requirements.txt
fi

echo "Dependências instaladas! ✓"
echo

echo "[4/4] Criando pastas necessárias..."
mkdir -p uploads
mkdir -p outputs
echo "Pastas criadas! ✓"
echo

echo "========================================"
echo "   Instalação Concluída com Sucesso!"
echo "========================================"
echo
echo "Para executar o sistema:"
echo "  python3 app.py"
echo
echo "Acesse: http://localhost:5000"
echo
read -p "Pressione Enter para executar o sistema agora..."

echo
echo "Executando o sistema..."
echo "Pressione Ctrl+C para parar"
echo
python3 app.py

