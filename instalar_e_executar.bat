@echo off
chcp 65001 >nul
echo ========================================
echo    Sistema PDF - Instalar e Executar
echo ========================================
echo.

echo [1/3] Instalando dependencias...
pip install flask PyMuPDF python-docx werkzeug
if %errorlevel% neq 0 (
    echo ERRO: Falha na instalacao!
    pause
    exit /b 1
)

echo.
echo [2/3] Criando pastas...
if not exist "uploads" mkdir uploads
if not exist "outputs" mkdir outputs

echo.
echo [3/3] Testando e executando...
python -c "import flask, fitz, docx, werkzeug; print('✓ Sistema pronto')"
if %errorlevel% neq 0 (
    echo ERRO: Dependencias nao funcionando!
    pause
    exit /b 1
)

echo.
echo ========================================
echo    Sistema Iniciando...
echo ========================================
echo.
echo Acesse: http://localhost:5000
echo Pressione Ctrl+C para parar
echo.

python app.py
