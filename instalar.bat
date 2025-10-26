@echo off
chcp 65001 >nul
echo ========================================
echo    Sistema PDF - Instalador Automatico
echo ========================================
echo.

echo [1/6] Verificando Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Python nao encontrado!
    echo Por favor, instale Python 3.8+ de: https://python.org
    echo.
    echo Pressione qualquer tecla para sair...
    pause >nul
    exit /b 1
)

python --version
echo Python encontrado! ✓
echo.

echo [2/6] Verificando pip...
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: pip nao encontrado!
    echo Instalando pip...
    python -m ensurepip --upgrade
    if %errorlevel% neq 0 (
        echo ERRO: Falha ao instalar pip!
        pause
        exit /b 1
    )
)

pip --version
echo pip encontrado! ✓
echo.

echo [3/6] Instalando dependencias...
echo.
echo Atualizando pip...
pip install --upgrade pip >nul 2>&1

echo Instalando Flask...
pip install flask >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar Flask!
    pause
    exit /b 1
)

echo Instalando PyMuPDF...
pip install PyMuPDF >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar PyMuPDF!
    pause
    exit /b 1
)

echo Instalando python-docx...
pip install python-docx >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar python-docx!
    pause
    exit /b 1
)

echo Instalando Werkzeug...
pip install werkzeug >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar Werkzeug!
    pause
    exit /b 1
)

echo Dependencias instaladas! ✓
echo.

echo [4/6] Criando pastas necessarias...
if not exist "uploads" mkdir uploads
if not exist "outputs" mkdir outputs
echo Pastas criadas! ✓
echo.

echo [5/6] Verificando arquivos do sistema...
if not exist "app.py" (
    echo ERRO: Arquivo app.py nao encontrado!
    echo Certifique-se de estar na pasta correta do projeto.
    pause
    exit /b 1
)

if not exist "templates\main.html" (
    echo ERRO: Templates nao encontrados!
    echo Certifique-se de estar na pasta correta do projeto.
    pause
    exit /b 1
)

echo Arquivos verificados! ✓
echo.

echo [6/6] Testando dependencias...
python -c "import flask, fitz, docx, werkzeug; print('Todas as dependencias OK')" >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Dependencias nao funcionando corretamente!
    echo Tentando reinstalar...
    pip install --force-reinstall flask PyMuPDF python-docx werkzeug
    if %errorlevel% neq 0 (
        echo ERRO: Falha na reinstalacao!
        pause
        exit /b 1
    )
)

echo Dependencias testadas! ✓
echo.

echo ========================================
echo    Instalacao Concluida com Sucesso!
echo ========================================
echo.
echo Para executar o sistema:
echo   python app.py
echo.
echo Acesse: http://localhost:5000
echo.
echo Pressione qualquer tecla para executar o sistema agora...
pause >nul

echo.
echo Executando o sistema...
echo Pressione Ctrl+C para parar
echo.
echo Aguarde alguns segundos para o servidor inicializar...
echo.

python app.py

if %errorlevel% neq 0 (
    echo.
    echo ERRO: Falha ao executar o sistema!
    echo Verifique se nao ha outro processo usando a porta 5000.
    echo.
    echo Tente executar manualmente:
    echo   python app.py
    echo.
    pause
)