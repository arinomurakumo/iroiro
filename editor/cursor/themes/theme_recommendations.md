# 🎨 Cursor テーマ設定ガイド

## 現在のテーマ設定
- **カラーテーマ**: theme-monokai-custom
- **アイコンテーマ**: seti

## テーマの適用方法

### 1. 設定ファイル経由
```json
{
  "workbench.colorTheme": "theme-monokai-custom",
  "workbench.iconTheme": "seti"
}
```

### 2. コマンドパレット経由
1. `Cmd+Shift+P` でコマンドパレットを開く
2. "Preferences: Color Theme" を選択
3. "theme-monokai-custom" を選択

## 推奨テーマ

### ダークテーマ
- **Monokai Custom** (現在使用中)
- **One Dark Pro**
- **Material Theme**

### ライトテーマ
- **Light+**
- **GitHub Light**
- **Solarized Light**

## カスタムテーマの作成

カスタムテーマを作成する場合は、以下の構造でJSONファイルを作成してください：

```json
{
  "name": "My Custom Theme",
  "type": "dark",
  "colors": {
    "editor.background": "#1e1e1e",
    "editor.foreground": "#d4d4d4"
  }
}
```
