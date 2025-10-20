#!/bin/bash

# VSCode テーマ色のエクスポートスクリプト
# 作成者: キラリ ✨💻

echo "🎨 VSCode テーマ色のエクスポートを開始します！"
echo "================================================"

# VSCode設定ディレクトリのパス
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"
THEME_DIR="themes"

# テーマディレクトリを作成
mkdir -p "$THEME_DIR"

# 現在のテーマ情報を取得
if [ -f "$VSCODE_CONFIG_DIR/settings.json" ]; then
    THEME_NAME=$(grep -o '"workbench.colorTheme": "[^"]*"' "$VSCODE_CONFIG_DIR/settings.json" | cut -d'"' -f4)
    ICON_THEME=$(grep -o '"workbench.iconTheme": "[^"]*"' "$VSCODE_CONFIG_DIR/settings.json" | cut -d'"' -f4)
    
    echo "🎨 現在のテーマ: $THEME_NAME"
    echo "🎨 アイコンテーマ: $ICON_THEME"
    
    # テーマ情報をJSONファイルに保存
    cat > "$THEME_DIR/current_theme.json" << EOF
{
  "name": "$THEME_NAME",
  "iconTheme": "$ICON_THEME",
  "exportDate": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "description": "VSCode テーマ設定のエクスポート"
}
EOF
    
    echo "✅ テーマ情報を保存しました: $THEME_DIR/current_theme.json"
    
    # カスタムテーマの場合は色情報も抽出
    if [[ "$THEME_NAME" == *"custom"* ]]; then
        echo "🔍 カスタムテーマを検出しました"
        
        # カスタムテーマの色設定を抽出
        cat > "$THEME_DIR/custom_theme_colors.json" << EOF
{
  "name": "$THEME_NAME",
  "type": "custom",
  "colors": {
    "note": "カスタムテーマの色設定は手動で設定する必要があります",
    "suggestedColors": {
      "background": "#1e1e1e",
      "foreground": "#d4d4d4",
      "selection": "#264f78",
      "cursor": "#ffffff",
      "lineHighlight": "#2a2d2e"
    }
  },
  "exportDate": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF
        echo "✅ カスタムテーマの色情報を保存しました: $THEME_DIR/custom_theme_colors.json"
    fi
    
    # テーマ設定の推奨事項を生成
    cat > "$THEME_DIR/theme_recommendations.md" << EOF
# 🎨 VSCode テーマ設定ガイド

## 現在のテーマ設定
- **カラーテーマ**: $THEME_NAME
- **アイコンテーマ**: $ICON_THEME

## テーマの適用方法

### 1. 設定ファイル経由
\`\`\`json
{
  "workbench.colorTheme": "$THEME_NAME",
  "workbench.iconTheme": "$ICON_THEME"
}
\`\`\`

### 2. コマンドパレット経由
1. \`Cmd+Shift+P\` でコマンドパレットを開く
2. "Preferences: Color Theme" を選択
3. "$THEME_NAME" を選択

## 推奨テーマ

### ダークテーマ
- **Monokai Custom** (現在使用中)
- **One Dark Pro**
- **Material Theme**
- **Dracula**

### ライトテーマ
- **Light+**
- **GitHub Light**
- **Solarized Light**
- **Quiet Light**

## カスタムテーマの作成

カスタムテーマを作成する場合は、以下の構造でJSONファイルを作成してください：

\`\`\`json
{
  "name": "My Custom Theme",
  "type": "dark",
  "colors": {
    "editor.background": "#1e1e1e",
    "editor.foreground": "#d4d4d4"
  }
}
\`\`\`

## VSCode テーマ拡張機能

### 人気のテーマ拡張機能
- **One Dark Pro** - Atom の One Dark テーマ
- **Material Theme** - Google Material Design
- **Dracula Official** - 人気のダークテーマ
- **Nord** - 北極をテーマにしたテーマ
EOF
    
    echo "✅ テーマ設定ガイドを生成しました: $THEME_DIR/theme_recommendations.md"
    
else
    echo "❌ settings.json が見つかりません"
    exit 1
fi

echo ""
echo "================================================"
echo "🎉 テーマエクスポート完了！"
echo "📁 エクスポート先: $THEME_DIR/"
echo "================================================"
