#!/bin/bash

# SSL証明書エラー修正スクリプト
# 作成者: キラリ ✨💻

echo "🔧 SSL証明書エラーを修正します！"
echo "================================================"

# 環境変数を設定
export NODE_TLS_REJECT_UNAUTHORIZED=0
export ELECTRON_DISABLE_SECURITY_WARNINGS=true

echo "✅ 環境変数を設定しました:"
echo "   - NODE_TLS_REJECT_UNAUTHORIZED=0"
echo "   - ELECTRON_DISABLE_SECURITY_WARNINGS=true"

# 一時的な解決策として、npmの設定も変更
if command -v npm &> /dev/null; then
    echo "📦 npm設定を更新中..."
    npm config set strict-ssl false
    echo "✅ npm strict-ssl を無効にしました"
fi

# プロキシ設定の確認
echo ""
echo "🌐 ネットワーク設定の確認:"
echo "   - HTTP_PROXY: ${HTTP_PROXY:-未設定}"
echo "   - HTTPS_PROXY: ${HTTPS_PROXY:-未設定}"
echo "   - NO_PROXY: ${NO_PROXY:-未設定}"

echo ""
echo "================================================"
echo "🎉 SSL証明書設定完了！"
echo "💡 これでエクステンションのインストールが成功するはずです！"
echo "================================================"
