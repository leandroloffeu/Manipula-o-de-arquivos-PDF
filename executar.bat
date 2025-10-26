@echo off
chcp 65001 >nul
echo ========================================
echo    Sistema PDF - Executar
echo ========================================
echo.

echo Verificando se o sistema esta pronto...
python -c "import flask, fitz, docx, werkzeug; print('✓ Sistema pronto')" 2>nul
if %errorlevel% neq 0 (
    echo ERRO: Dependencias nao instaladas!
    echo Execute: instalar_simples.bat
    pause
    exit /b 1
)

echo.
echo Iniciando servidor...
echo Acesse: http://localhost:5000
echo Pressione Ctrl+C para parar
echo.

python app.py
