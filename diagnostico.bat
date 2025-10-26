@echo off
chcp 65001 >nul
echo ========================================
echo    Diagnostico do Sistema PDF
echo ========================================
echo.

echo [1] Informacoes do Sistema...
echo OS: %OS%
echo Arquitetura: %PROCESSOR_ARCHITECTURE%
echo Usuario: %USERNAME%
echo Pasta atual: %CD%
echo.

echo [2] Verificando Python...
python --version 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python NAO encontrado!
    echo Solucao: Instale Python de https://python.org
    echo.
) else (
    echo ✅ Python encontrado!
)
echo.

echo [3] Verificando pip...
pip --version 2>&1
if %errorlevel% neq 0 (
    echo ❌ pip NAO encontrado!
    echo Solucao: Execute: python -m ensurepip --upgrade
    echo.
) else (
    echo ✅ pip encontrado!
)
echo.

echo [4] Verificando dependencias...
echo Testando Flask...
python -c "import flask; print('✅ Flask:', flask.__version__)" 2>&1
if %errorlevel% neq 0 (
    echo ❌ Flask NAO instalado!
)

echo Testando PyMuPDF...
python -c "import fitz; print('✅ PyMuPDF:', fitz.version)" 2>&1
if %errorlevel% neq 0 (
    echo ❌ PyMuPDF NAO instalado!
)

echo Testando python-docx...
python -c "import docx; print('✅ python-docx instalado')" 2>&1
if %errorlevel% neq 0 (
    echo ❌ python-docx NAO instalado!
)

echo Testando Werkzeug...
python -c "import werkzeug; print('✅ Werkzeug:', werkzeug.__version__)" 2>&1
if %errorlevel% neq 0 (
    echo ❌ Werkzeug NAO instalado!
)
echo.

echo [5] Verificando arquivos do projeto...
if exist "app.py" (
    echo ✅ app.py encontrado
) else (
    echo ❌ app.py NAO encontrado!
)

if exist "templates\main.html" (
    echo ✅ templates\main.html encontrado
) else (
    echo ❌ templates\main.html NAO encontrado!
)

if exist "templates\index.html" (
    echo ✅ templates\index.html encontrado
) else (
    echo ❌ templates\index.html NAO encontrado!
)

if exist "requirements.txt" (
    echo ✅ requirements.txt encontrado
) else (
    echo ❌ requirements.txt NAO encontrado!
)
echo.

echo [6] Verificando pastas...
if exist "uploads" (
    echo ✅ pasta uploads encontrada
) else (
    echo ❌ pasta uploads NAO encontrada!
)

if exist "outputs" (
    echo ✅ pasta outputs encontrada
) else (
    echo ❌ pasta outputs NAO encontrada!
)
echo.

echo [7] Verificando porta 5000...
netstat -an | findstr :5000
if %errorlevel% neq 0 (
    echo ✅ Porta 5000 livre
) else (
    echo ⚠️ Porta 5000 em uso!
    echo Solucao: Pare outros servidores ou use outra porta
)
echo.

echo [8] Testando execucao do app.py...
echo Tentando executar app.py por 5 segundos...
timeout /t 1 /nobreak >nul
start /B python app.py
timeout /t 5 /nobreak >nul

netstat -an | findstr :5000
if %errorlevel% neq 0 (
    echo ❌ app.py NAO iniciou corretamente!
    echo Possivel erro no codigo ou dependencias
) else (
    echo ✅ app.py iniciou com sucesso!
    echo Servidor rodando em http://localhost:5000
)

echo.
echo Parando servidor de teste...
taskkill /F /IM python.exe >nul 2>&1
echo.

echo ========================================
echo    Diagnostico Concluido
echo ========================================
echo.
echo Se houver erros ❌, execute as solucoes sugeridas.
echo Se tudo estiver ✅, execute: instalar.bat
echo.
pause
