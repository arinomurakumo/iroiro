#!/bin/bash

# VSCode 設定とテーマの復元スクリプト
# 作成者: キラリ ✨💻

echo "🚀 VSCode 設定とテーマの復元を開始します！"
echo "================================================"

# VSCode設定ディレクトリのパス
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
BACKUP_DIR="config_backup"

# バックアップディレクトリの存在確認
if [ ! -d "$BACKUP_DIR" ]; then
    echo "❌ バックアップディレクトリが見つかりません: $BACKUP_DIR"
    echo "まず backup_config.sh を実行してください"
    exit 1
fi

echo "📋 復元対象ファイル:"
echo "  - settings.json (設定ファイル)"
echo "  - keybindings.json (キーバインド)"
echo "  - snippets/ (スニペット)"
echo ""

# 既存の設定をバックアップ（安全のため）
echo "🛡️  既存の設定をバックアップ中..."
mkdir -p "${BACKUP_DIR}_original_$(date +%Y%m%d_%H%M%S)"

if [ -f "$VSCODE_CONFIG_DIR/settings.json" ]; then
    cp "$VSCODE_CONFIG_DIR/settings.json" "${BACKUP_DIR}_original_$(date +%Y%m%d_%H%M%S)/"
fi

if [ -f "$VSCODE_CONFIG_DIR/keybindings.json" ]; then
    cp "$VSCODE_CONFIG_DIR/keybindings.json" "${BACKUP_DIR}_original_$(date +%Y%m%d_%H%M%S)/"
fi

if [ -d "$VSCODE_CONFIG_DIR/snippets" ]; then
    cp -r "$VSCODE_CONFIG_DIR/snippets" "${BACKUP_DIR}_original_$(date +%Y%m%d_%H%M%S)/"
fi

echo "✅ 既存設定のバックアップ完了"
echo ""

# settings.json を復元
if [ -f "$BACKUP_DIR/settings.json" ]; then
    echo "📦 settings.json を復元中..."
    cp "$BACKUP_DIR/settings.json" "$VSCODE_CONFIG_DIR/"
    echo "✅ settings.json 復元完了"
else
    echo "❌ settings.json が見つかりません"
fi

# keybindings.json を復元
if [ -f "$BACKUP_DIR/keybindings.json" ]; then
    echo "📦 keybindings.json を復元中..."
    cp "$BACKUP_DIR/keybindings.json" "$VSCODE_CONFIG_DIR/"
    echo "✅ keybindings.json 復元完了"
else
    echo "❌ keybindings.json が見つかりません"
fi

# snippets ディレクトリを復元
if [ -d "$BACKUP_DIR/snippets" ]; then
    echo "📦 snippets/ を復元中..."
    cp -r "$BACKUP_DIR/snippets" "$VSCODE_CONFIG_DIR/"
    echo "✅ snippets/ 復元完了"
else
    echo "❌ snippets/ が見つかりません"
fi

# テーマ情報を表示
if [ -f "$BACKUP_DIR/theme_info.json" ]; then
    echo ""
    echo "🎨 復元されたテーマ情報:"
    cat "$BACKUP_DIR/theme_info.json" | python3 -m json.tool 2>/dev/null || cat "$BACKUP_DIR/theme_info.json"
fi

# 復元完了
echo ""
echo "================================================"
echo "🎉 復元完了！"
echo "🔄 VSCodeを再起動してください"
echo "================================================"
