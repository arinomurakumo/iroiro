#!/bin/bash

# シンプル版: エクステンション一括インストール
echo "🚀 エクステンション一括インストール開始！"

# 方法1: ファイルから一括インストール
cat extension.txt | xargs -I {} cursor --install-extension {} --force

echo "✅ 完了！"
