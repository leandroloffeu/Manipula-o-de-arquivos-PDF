#!/usr/bin/env python3
"""
Sistema PDF - Instalador Automático
Instala todas as dependências necessárias automaticamente
"""

import sys
import subprocess
import os
import platform

def print_header():
    print("=" * 50)
    print("   Sistema PDF - Instalador Automático")
    print("=" * 50)
    print()

def check_python():
    """Verifica se o Python está instalado"""
    print("[1/5] Verificando Python...")
    
    version = sys.version_info
    if version.major < 3 or (version.major == 3 and version.minor < 8):
        print(f"❌ ERRO: Python {version.major}.{version.minor} encontrado!")
        print("   Requerido: Python 3.8 ou superior")
        print("   Baixe de: https://python.org")
        return False
    
    print(f"✅ Python {version.major}.{version.minor}.{version.micro} encontrado!")
    return True

def check_pip():
    """Verifica se o pip está disponível"""
    print("\n[2/5] Verificando pip...")
    
    try:
        import pip
        print("✅ pip encontrado!")
        return True
    except ImportError:
        print("❌ pip não encontrado!")
        print("   Tentando instalar pip...")
        try:
            subprocess.check_call([sys.executable, "-m", "ensurepip", "--upgrade"])
            print("✅ pip instalado com sucesso!")
            return True
        except subprocess.CalledProcessError:
            print("❌ Falha ao instalar pip!")
            return False

def install_dependencies():
    """Instala as dependências necessárias"""
    print("\n[3/5] Instalando dependências...")
    
    dependencies = [
        "flask",
        "PyMuPDF", 
        "python-docx",
        "werkzeug"
    ]
    
    print("   Atualizando pip...")
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "--upgrade", "pip"])
    except subprocess.CalledProcessError:
        print("   ⚠️  Aviso: Falha ao atualizar pip, continuando...")
    
    print("   Instalando dependências principais...")
    for dep in dependencies:
        try:
            print(f"   📦 Instalando {dep}...")
            subprocess.check_call([sys.executable, "-m", "pip", "install", dep])
            print(f"   ✅ {dep} instalado!")
        except subprocess.CalledProcessError:
            print(f"   ❌ Falha ao instalar {dep}!")
            return False
    
    return True

def create_directories():
    """Cria as pastas necessárias"""
    print("\n[4/5] Criando pastas necessárias...")
    
    directories = ["uploads", "outputs"]
    
    for directory in directories:
        if not os.path.exists(directory):
            os.makedirs(directory)
            print(f"   📁 Pasta '{directory}' criada!")
        else:
            print(f"   📁 Pasta '{directory}' já existe!")
    
    return True

def verify_installation():
    """Verifica se a instalação foi bem-sucedida"""
    print("\n[5/5] Verificando instalação...")
    
    try:
        import flask
        import fitz  # PyMuPDF
        import docx  # python-docx
        from werkzeug.utils import secure_filename
        
        print("✅ Todas as dependências importadas com sucesso!")
        return True
    except ImportError as e:
        print(f"❌ Erro ao importar dependências: {e}")
        return False

def main():
    """Função principal do instalador"""
    print_header()
    
    # Verificar Python
    if not check_python():
        input("\nPressione Enter para sair...")
        return False
    
    # Verificar pip
    if not check_pip():
        input("\nPressione Enter para sair...")
        return False
    
    # Instalar dependências
    if not install_dependencies():
        print("\n❌ Falha na instalação das dependências!")
        input("Pressione Enter para sair...")
        return False
    
    # Criar pastas
    if not create_directories():
        print("\n❌ Falha ao criar pastas!")
        input("Pressione Enter para sair...")
        return False
    
    # Verificar instalação
    if not verify_installation():
        print("\n❌ Falha na verificação da instalação!")
        input("Pressione Enter para sair...")
        return False
    
    # Sucesso!
    print("\n" + "=" * 50)
    print("   🎉 Instalação Concluída com Sucesso!")
    print("=" * 50)
    print()
    print("📋 Próximos passos:")
    print("   1. Execute: python app.py")
    print("   2. Acesse: http://localhost:5000")
    print("   3. Use o sistema!")
    print()
    
    # Perguntar se quer executar agora
    try:
        run_now = input("🚀 Executar o sistema agora? (s/n): ").lower().strip()
        if run_now in ['s', 'sim', 'y', 'yes']:
            print("\n🚀 Executando o sistema...")
            print("   Pressione Ctrl+C para parar")
            print()
            subprocess.run([sys.executable, "app.py"])
    except KeyboardInterrupt:
        print("\n👋 Sistema interrompido pelo usuário.")
    
    return True

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n👋 Instalação interrompida pelo usuário.")
    except Exception as e:
        print(f"\n❌ Erro inesperado: {e}")
        input("Pressione Enter para sair...")

