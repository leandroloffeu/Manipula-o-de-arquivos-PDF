@echo off
chcp 65001 >nul
echo ========================================
echo    Teste do Sistema PDF
echo ========================================
echo.

echo Verificando se o sistema esta funcionando...
echo.

echo [1] Verificando Python...
python --version
if %errorlevel% neq 0 (
    echo ERRO: Python nao encontrado!
    pause
    exit /b 1
)
echo ✓ Python OK
echo.

echo [2] Verificando dependencias...
python -c "import flask, fitz, docx, werkzeug; print('✓ Todas as dependencias OK')"
if %errorlevel% neq 0 (
    echo ERRO: Dependencias nao instaladas!
    echo Execute: instalar.bat
    pause
    exit /b 1
)
echo.

echo [3] Verificando arquivos...
if not exist "app.py" (
    echo ERRO: app.py nao encontrado!
    pause
    exit /b 1
)
if not exist "templates\main.html" (
    echo ERRO: Templates nao encontrados!
    pause
    exit /b 1
)
echo ✓ Arquivos OK
echo.

echo [4] Testando servidor...
echo Iniciando servidor em background...
start /B python app.py
timeout /t 3 /nobreak >nul

echo Verificando se a porta 5000 esta ativa...
netstat -an | findstr :5000
if %errorlevel% neq 0 (
    echo ERRO: Servidor nao iniciou!
    pause
    exit /b 1
)
echo ✓ Servidor OK
echo.

echo ========================================
echo    Sistema Funcionando Perfeitamente!
echo ========================================
echo.
echo Acesse: http://localhost:5000
echo.
echo Pressione qualquer tecla para abrir no navegador...
pause >nul

start http://localhost:5000

echo.
echo Sistema iniciado! Pressione qualquer tecla para sair...
pause >nul

echo Parando servidor...
taskkill /F /IM python.exe >nul 2>&1
echo Servidor parado.
