#!/bin/bash

# シンプル版: VSCode エクステンション一括インストール
echo "🚀 VSCode エクステンション一括インストール開始！"

# 方法1: ファイルから一括インストール
cat vscode_extensions.txt | while read -r extension_id; do
    if [ -n "$extension_id" ]; then
        echo "📦 インストール中: $extension_id"
        code --install-extension "$extension_id" --force
    fi
done

echo "✅ 完了！"
