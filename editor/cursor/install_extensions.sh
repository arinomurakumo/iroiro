#!/bin/bash

# Cursor Extension 一括インストールスクリプト
# 作成者: キラリ ✨💻

echo "🚀 Cursor Extension 一括インストールを開始します！"
echo "================================================"

# エクステンション一覧ファイルの存在確認
if [ ! -f "extension.txt" ]; then
    echo "❌ extension.txt が見つかりません！"
    echo "まず cursor --list-extensions > extension.txt を実行してください"
    exit 1
fi

# インストール済みエクステンションを取得
echo "📋 現在インストール済みのエクステンションを確認中..."
installed_extensions=$(cursor --list-extensions)

# カウンター
total_count=0
installed_count=0
skipped_count=0

echo "🔧 エクステンションのインストールを開始します..."
echo ""

# ファイルからエクステンションIDを読み込んでインストール
while IFS= read -r extension_id; do
    # 空行をスキップ
    if [ -z "$extension_id" ]; then
        continue
    fi
    
    total_count=$((total_count + 1))
    
    # 既にインストール済みかチェック
    if echo "$installed_extensions" | grep -q "^$extension_id$"; then
        echo "⏭️  スキップ: $extension_id (既にインストール済み)"
        skipped_count=$((skipped_count + 1))
    else
        echo "📦 インストール中: $extension_id"
        install_output=$(cursor --install-extension "$extension_id" --force 2>&1)
        install_exit_code=$?
        
        # インストール結果をチェック
        if [ $install_exit_code -eq 0 ]; then
            # 既にインストール済みの場合も成功として扱う
            if echo "$install_output" | grep -q "already installed"; then
                echo "✅ 成功: $extension_id (既にインストール済み)"
            else
                echo "✅ 成功: $extension_id"
            fi
            installed_count=$((installed_count + 1))
        else
            echo "❌ 失敗: $extension_id"
            echo "   エラー: $install_output"
        fi
    fi
    echo ""
done < extension.txt

echo "================================================"
echo "🎉 インストール完了！"
echo "📊 統計:"
echo "   - 総数: $total_count"
echo "   - 新規インストール: $installed_count"
echo "   - スキップ: $skipped_count"
echo "================================================"

if [ $installed_count -gt 0 ]; then
    echo "🔄 Cursorを再起動することをお勧めします！"
fi
