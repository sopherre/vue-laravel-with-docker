#!/bin/bash

# 現在のワークスペースフォルダ名を取得
WORKSPACE_NAME=$(basename "$PWD")

# Viewアプリのパッケージインストール
pnpm -C view install

# Viewアプリの起動
pnpm -C view dev &

# APIのパッケージインストール
composer install --working-dir=api

# 環境変数のAPP_KEYを設定
php api/artisan key:generate --force

# APIアプリの起動
php api/artisan serve --host=0.0.0.0 --port=8000 &

# Nginx をホスト側の設定ファイルで起動
echo "🔄 Starting Nginx with custom configuration..."
NGINX_CONF_PATH="/workspaces/$WORKSPACE_NAME/.devcontainer/nginx/default.conf"
nginx -c "$NGINX_CONF_PATH"

echo "✅ Nginx setup completed!"
