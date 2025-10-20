#!/bin/bash

# VSCode 設定とテーマのバックアップスクリプト
# 作成者: キラリ ✨💻

echo "🚀 VSCode 設定とテーマのバックアップを開始します！"
echo "================================================"

# VSCode設定ディレクトリのパス
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
BACKUP_DIR="config_backup"

# バックアップディレクトリを作成
mkdir -p "$BACKUP_DIR"

echo "📋 バックアップ対象ファイル:"
echo "  - settings.json (設定ファイル)"
echo "  - keybindings.json (キーバインド)"
echo "  - snippets/ (スニペット)"
echo ""

# settings.json をバックアップ
if [ -f "$VSCODE_CONFIG_DIR/settings.json" ]; then
    echo "📦 settings.json をバックアップ中..."
    cp "$VSCODE_CONFIG_DIR/settings.json" "$BACKUP_DIR/"
    echo "✅ settings.json バックアップ完了"
else
    echo "❌ settings.json が見つかりません"
fi

# keybindings.json をバックアップ
if [ -f "$VSCODE_CONFIG_DIR/keybindings.json" ]; then
    echo "📦 keybindings.json をバックアップ中..."
    cp "$VSCODE_CONFIG_DIR/keybindings.json" "$BACKUP_DIR/"
    echo "✅ keybindings.json バックアップ完了"
else
    echo "❌ keybindings.json が見つかりません"
fi

# snippets ディレクトリをバックアップ
if [ -d "$VSCODE_CONFIG_DIR/snippets" ]; then
    echo "📦 snippets/ をバックアップ中..."
    cp -r "$VSCODE_CONFIG_DIR/snippets" "$BACKUP_DIR/"
    echo "✅ snippets/ バックアップ完了"
else
    echo "❌ snippets/ が見つかりません"
fi

# テーマ情報を抽出
echo "🎨 テーマ情報を抽出中..."
if [ -f "$VSCODE_CONFIG_DIR/settings.json" ]; then
    # テーマ名を抽出
    THEME_NAME=$(grep -o '"workbench.colorTheme": "[^"]*"' "$VSCODE_CONFIG_DIR/settings.json" | cut -d'"' -f4)
    ICON_THEME=$(grep -o '"workbench.iconTheme": "[^"]*"' "$VSCODE_CONFIG_DIR/settings.json" | cut -d'"' -f4)
    
    echo "🎨 現在のテーマ: $THEME_NAME"
    echo "🎨 アイコンテーマ: $ICON_THEME"
    
    # テーマ情報をファイルに保存
    cat > "$BACKUP_DIR/theme_info.json" << EOF
{
  "colorTheme": "$THEME_NAME",
  "iconTheme": "$ICON_THEME",
  "backupDate": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF
    echo "✅ テーマ情報を保存しました"
fi

# バックアップ完了
echo ""
echo "================================================"
echo "🎉 バックアップ完了！"
echo "📁 バックアップ先: $BACKUP_DIR/"
echo "================================================"
