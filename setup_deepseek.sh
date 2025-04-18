#!/bin/bash

# 安裝 Homebrew（如果沒裝過）
if ! command -v brew &> /dev/null
then
    echo "🛠️ 安裝 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 安裝 Python & Ollama
brew install python ollama

# 建立 Python 虛擬環境
python3 -m venv deepseek-venv
source deepseek-venv/bin/activate

# 安裝 Python 套件 (支援 MPS)
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/mps
pip install transformers accelerate

# 安裝 Text Generation WebUI (可選)
git clone https://github.com/oobabooga/text-generation-webui.git
cd text-generation-webui
pip install -r requirements-mps.txt

echo "✅ 安裝完成！請用 source deepseek-venv/bin/activate 啟用虛擬環境"
