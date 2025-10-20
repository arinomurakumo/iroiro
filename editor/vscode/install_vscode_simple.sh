#!/bin/bash

# シンプル版: VSCode エクステンション一括インストール
echo "🚀 VSCode エクステンション一括インストール開始！"

# 方法1: ファイルから一括インストール
cat vscode_extensions.txt | xargs -I {} code --install-extension {} --force

echo "✅ 完了！"
