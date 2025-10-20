#!/bin/bash

# 統合版: Cursor & VSCode エクステンション一括インストール
# 作成者: キラリ ✨💻

echo "🌟 統合エクステンション一括インストーラー"
echo "================================================"
echo ""

# エディター選択
echo "どのエディターのエクステンションをインストールしますか？"
echo "1) Cursor のみ"
echo "2) VSCode のみ" 
echo "3) 両方"
echo "4) 現在のエクステンション一覧を更新"
echo ""
read -p "選択してください (1-4): " choice

case $choice in
    1)
        echo "🚀 Cursor エクステンションをインストールします..."
        if [ -f "cursor/install_extensions.sh" ]; then
            cd cursor && ./install_extensions.sh
        else
            echo "❌ cursor/install_extensions.sh が見つかりません！"
        fi
        ;;
    2)
        echo "🚀 VSCode エクステンションをインストールします..."
        if [ -f "vscode/install_vscode_extensions.sh" ]; then
            cd vscode && ./install_vscode_extensions.sh
        else
            echo "❌ vscode/install_vscode_extensions.sh が見つかりません！"
        fi
        ;;
    3)
        echo "🚀 両方のエディターのエクステンションをインストールします..."
        echo ""
        echo "📦 Cursor エクステンションをインストール中..."
        if [ -f "cursor/install_extensions.sh" ]; then
            cd cursor && ./install_extensions.sh
        fi
        echo ""
        echo "📦 VSCode エクステンションをインストール中..."
        if [ -f "vscode/install_vscode_extensions.sh" ]; then
            cd vscode && ./install_vscode_extensions.sh
        fi
        ;;
    4)
        echo "📋 エクステンション一覧を更新中..."
        echo "Cursor エクステンション一覧を更新..."
        cursor --list-extensions > cursor/extension.txt
        echo "VSCode エクステンション一覧を更新..."
        code --list-extensions > vscode/vscode_extensions.txt
        echo "✅ 更新完了！"
        ;;
    *)
        echo "❌ 無効な選択です。1-4の数字を入力してください。"
        exit 1
        ;;
esac

echo ""
echo "🎉 処理完了！"
echo "================================================"
