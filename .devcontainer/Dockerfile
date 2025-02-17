# PHP 8.4.3 の公式イメージをベースにする
FROM php:8.4.3-fpm

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
  curl wget git unzip ca-certificates nginx

# Composer をコピー
COPY --from=composer:2.8.5 /usr/bin/composer /usr/bin/composer

# Node.js 22.x（LTS）をインストール
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
  apt-get install -y nodejs

# Nginxの設定をコピー
COPY nginx.conf /etc/nginx/nginx.conf

# 作業ディレクトリ
WORKDIR /workspace

# シェルを bash に設定
SHELL ["/bin/bash", "-c"]