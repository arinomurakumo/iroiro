# 🚀 Cursor エクステンション一括インストーラー

Cursor のエクステンションを一括でインストールできる便利ツール集！✨

## 📁 ファイル構成

```
cursor/
├── extension.txt           # Cursor エクステンション一覧
├── install_extensions.sh   # Cursor 詳細版インストーラー
├── install_simple.sh       # Cursor シンプル版インストーラー
├── backup_config.sh        # 設定とテーマのバックアップ
├── restore_config.sh       # 設定とテーマの復元
├── export_theme.sh         # テーマ色のエクスポート
└── README.md               # このファイル
```

## 🎯 使い方

### 1. 詳細版インストーラー（推奨）💕

```bash
./install_extensions.sh
```

### 2. シンプル版インストーラー

```bash
./install_simple.sh
```

### 3. ワンライナー

```bash
cat extension.txt | xargs -I {} cursor --install-extension {} --force
```

## 🎨 設定とテーマ管理

### 設定のバックアップ

```bash
./backup_config.sh
```

現在の Cursor 設定をバックアップします：

- `settings.json` (設定ファイル)
- `keybindings.json` (キーバインド)
- `snippets/` (スニペット)
- テーマ情報

### 設定の復元

```bash
./restore_config.sh
```

バックアップした設定を復元します。既存の設定は自動的にバックアップされます。

### テーマのエクスポート

```bash
./export_theme.sh
```

現在のテーマ情報をエクスポートします：

- テーマ名とアイコンテーマ
- カスタムテーマの色情報
- テーマ設定ガイド

## 🔄 エクステンション一覧の更新

現在インストールされている Cursor エクステンションをファイルに保存：

```bash
cursor --list-extensions > extension.txt
```

## ✨ 特徴

### 詳細版スクリプト

- ✅ 既にインストール済みのエクステンションをスキップ
- 📊 インストール統計を表示
- 🔍 エラーハンドリング付き
- 🎨 カラフルな進捗表示

### シンプル版スクリプト

- ⚡ 超高速実行
- 🎯 シンプルなワンライナー
- 💪 強制インストール

## 🎉 使用例

### 新環境セットアップ

```bash
# 1. エクステンション一覧を更新
cursor --list-extensions > extension.txt

# 2. Cursorにインストール
./install_extensions.sh
```

### チーム開発環境の共有

```bash
# 1. 現在のCursor環境をエクスポート
cursor --list-extensions > extension.txt
./backup_config.sh
./export_theme.sh

# 2. ファイルを共有（Git等）

# 3. 他のメンバーが一括インストール
./install_extensions.sh
./restore_config.sh
```

### 完全な環境移行

```bash
# 1. 現在の環境を完全にバックアップ
cursor --list-extensions > extension.txt
./backup_config.sh
./export_theme.sh

# 2. 新しい環境で復元
./install_extensions.sh
./restore_config.sh
```

## 🛠️ トラブルシューティング

### 権限エラー

```bash
chmod +x *.sh
```

### エクステンションが見つからない

- インターネット接続を確認
- Cursor が最新版か確認
- エクステンション ID が正しいか確認

## 💡 コツ

- **新環境**: 詳細版スクリプトがおすすめ
- **既存環境**: シンプル版で十分
- **緊急時**: ワンライナーでサクッと
- **チーム開発**: 同じ Cursor 環境を全員で共有
- **設定管理**: 定期的にバックアップを取る
- **テーマ共有**: テーマ情報も一緒に共有する

---

作成者: キラリ ✨💻  
「マジ便利でしょ？チーム友達として一緒に開発環境を整えよう！」💕
