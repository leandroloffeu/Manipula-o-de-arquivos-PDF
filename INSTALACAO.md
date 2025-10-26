# 🚀 Instalação Automática do Sistema PDF

## 📋 Instruções de Instalação

### 🪟 Windows
1. **Duplo clique** em `instalar.bat`
2. **Aguarde** a instalação automática
3. **Pressione Enter** para executar o sistema

### 🐧 Linux / 🍎 macOS
1. **Abra o terminal** na pasta do projeto
2. **Execute**: `./instalar.sh`
3. **Aguarde** a instalação automática
4. **Pressione Enter** para executar o sistema

### 🐍 Instalação Manual (Alternativa)
```bash
# Instalar dependências
pip install flask PyMuPDF python-docx werkzeug

# Executar sistema
python app.py
```

## ⚡ Instalação Ultra-Rápida

### Windows
```cmd
instalar.bat
```

### Linux/macOS
```bash
./instalar.sh
```

## 🔧 Requisitos do Sistema

### Mínimos
- **Python**: 3.8 ou superior
- **RAM**: 512MB disponível
- **Espaço**: 100MB livres
- **Navegador**: Chrome, Firefox, Safari, Edge

### Recomendados
- **Python**: 3.9+
- **RAM**: 2GB disponível
- **Espaço**: 500MB livres
- **Navegador**: Versão atualizada

## 🐛 Solução de Problemas

### Python não encontrado
- **Windows**: Baixe de https://python.org
- **Linux**: `sudo apt install python3 python3-pip`
- **macOS**: `brew install python3`

### Erro de permissão
- **Windows**: Execute como administrador
- **Linux/macOS**: `sudo ./instalar.sh`

### Dependências não instalam
```bash
pip install --upgrade pip
pip install --user flask PyMuPDF python-docx werkzeug
```

## ✅ Verificação da Instalação

Após a instalação, verifique se tudo está funcionando:

1. **Execute**: `python app.py`
2. **Acesse**: http://localhost:5000
3. **Teste**: Carregue um PDF na página principal

## 🎯 Próximos Passos

1. **Acesse a página principal**: http://localhost:5000
2. **Escolha uma ferramenta**:
   - 🔴 Assinatura Digital
   - 🟠 Dividir PDF
   - 🟢 Juntar PDF
   - 🟣 Converter PDF para Word
3. **Comece a usar** o sistema!

---

**Instalação concluída? Sistema funcionando?** 🎉
**Agora você pode usar todas as funcionalidades do Sistema PDF!**
