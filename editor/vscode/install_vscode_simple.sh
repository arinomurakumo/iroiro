#!/bin/bash

# シンプル版: VSCode エクステンション一括インストール
echo "🚀 VSCode エクステンション一括インストール開始！"

# 方法1: ファイルから一括インストール
# SSL証明書エラーを回避するための環境変数設定
export NODE_TLS_REJECT_UNAUTHORIZED=0

cat vscode_extensions.txt | while read -r extension_id; do
    if [ -n "$extension_id" ]; then
        echo "📦 インストール中: $extension_id"
        code --install-extension "$extension_id" --force
    fi
done

echo "✅ 完了！"
