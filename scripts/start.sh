#!/bin/bash

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
nginx -c /workspaces/vue-laravel/.devcontainer/nginx/default.conf

echo "✅ Nginx setup completed!"
