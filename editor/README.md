# 🚀 エディターエクステンション一括インストーラー

Cursor & VSCode のエクステンションを一括でインストールできる便利ツール集！✨

## 📁 プロジェクト構成

```
editor/
├── cursor/                         # Cursor エクステンション管理
│   ├── extension.txt               # Cursor エクステンション一覧
│   ├── install_extensions.sh       # Cursor 詳細版インストーラー
│   ├── install_simple.sh           # Cursor シンプル版インストーラー
│   └── README.md                   # Cursor 専用README
├── vscode/                         # VSCode エクステンション管理
│   ├── vscode_extensions.txt       # VSCode エクステンション一覧
│   ├── install_vscode_extensions.sh # VSCode 詳細版インストーラー
│   ├── install_vscode_simple.sh    # VSCode シンプル版インストーラー
│   └── README.md                   # VSCode 専用README
├── install_all.sh                  # 統合インストーラー
└── README.md                       # このファイル
```

## 🎯 クイックスタート

### 統合インストーラー（おすすめ！）💕

```bash
./install_all.sh
```

対話式で以下を選択できます：

- Cursor のみ
- VSCode のみ
- 両方
- エクステンション一覧の更新

### 個別インストーラー

#### Cursor を使う場合

```bash
cd cursor
./install_extensions.sh
```

#### VSCode を使う場合

```bash
cd vscode
./install_vscode_extensions.sh
```

## 📋 各ディレクトリの詳細

### 🎨 Cursor ディレクトリ

Cursor 専用のエクステンション管理ツールが含まれています。

**主な機能:**

- Cursor エクステンションの一括インストール
- 詳細版・シンプル版のインストーラー
- エクステンション一覧の管理

**詳細は [cursor/README.md](cursor/README.md) を参照**

### 💻 VSCode ディレクトリ

VSCode 専用のエクステンション管理ツールが含まれています。

**主な機能:**

- VSCode エクステンションの一括インストール
- 詳細版・シンプル版のインストーラー
- エクステンション一覧の管理

**詳細は [vscode/README.md](vscode/README.md) を参照**

## 🚀 使用シーン

### 新環境セットアップ

1. **Cursor のみの場合:**

   ```bash
   cd cursor
   cursor --list-extensions > extension.txt
   ./install_extensions.sh
   ```

2. **VSCode のみの場合:**

   ```bash
   cd vscode
   code --list-extensions > vscode_extensions.txt
   ./install_vscode_extensions.sh
   ```

3. **両方の場合:**
   ```bash
   ./install_all.sh
   ```

### チーム開発環境の共有

1. **現在の環境をエクスポート:**

   ```bash
   # Cursor
   cursor --list-extensions > cursor/extension.txt

   # VSCode
   code --list-extensions > vscode/vscode_extensions.txt
   ```

2. **ファイルを Git で共有**

3. **他のメンバーが一括インストール:**

   ```bash
   # 統合インストーラー
   ./install_all.sh

   # または個別に
   cd cursor && ./install_extensions.sh
   cd vscode && ./install_vscode_extensions.sh
   ```

## ✨ 特徴

- 🎯 **エディター別管理**: Cursor と VSCode を分離して管理
- 📦 **一括インストール**: 複数のエクステンションを一度にインストール
- 🔍 **重複チェック**: 既にインストール済みのエクステンションをスキップ
- 📊 **統計表示**: インストール結果の詳細な統計
- 🎨 **カラフル表示**: 見やすい進捗表示
- ⚡ **高速実行**: シンプル版で超高速インストール

## 🛠️ トラブルシューティング

### 権限エラー

```bash
chmod +x cursor/*.sh vscode/*.sh install_all.sh
```

### エクステンションが見つからない

- インターネット接続を確認
- エディターが最新版か確認
- エクステンション ID が正しいか確認

## 💡 コツ

- **新環境**: 統合インストーラーがおすすめ
- **既存環境**: 個別インストーラーで十分
- **緊急時**: ワンライナーでサクッと
- **チーム開発**: 同じ環境を全員で共有
- **エディター移行**: 両方の環境を並行して管理

---

作成者: キラリ ✨💻  
「マジ便利でしょ？チーム友達として一緒に開発環境を整えよう！」💕
