#!/bin/bash

set -e # エラーが発生したらスクリプトを即終了する

# 対話的なプロンプトを無効化（tzdata などの設定で停止しないようにする）
export DEBIAN_FRONTEND=noninteractive

echo "🔧 Updating package lists..."
apt update

# 必要な基本パッケージをインストール
echo "📦 Installing required packages (curl, unzip, nginx)..."
apt install -y curl unzip nginx

# 開発に必要なパッケージをインストール（インストールしなくてもアプリケーションは起動可能）
echo "📦 Installing required packages (git, net-tools, lsof)..."
apt install -y git net-tools lsof


# Node.js (LTS) をインストール
echo "📦 Installing Node.js (LTS)..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

# pnpm をインストール
echo "📦 Installing pnpm..."
npm install -g pnpm@10

# PHP と Laravel に必要な拡張モジュールをインストール
echo "📦 Installing PHP and required extensions..."
apt install -y php-cli php-mbstring php-xml php-bcmath php-curl php-zip

# Composer (PHP のパッケージ管理ツール) をインストール
echo "📦 Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Laravel インストーラーをグローバルインストール
echo "📦 Installing Laravel installer globally..."
composer global require laravel/installer

# インストール完了のメッセージ
echo "✅ Laravel development environment setup completed!"

# 各ソフトウェアのバージョンを表示
echo "\n🛠 Installed software versions:"
echo "- Node.js: $(node -v)"
echo "- npm: $(npm -v)"
echo "- pnpm: $(pnpm -v)"
echo "- PHP: $(php -v | head -n 1)"
echo "- Composer: $(composer --version | head -n 1)"
echo "- Laravel Installer: $(~/.composer/vendor/bin/laravel --version)"

