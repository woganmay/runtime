FROM php:8.3-cli

WORKDIR /var/www/html

# Install the PostgreSQL PDO extension
# Docs: https://github.com/mlocati/docker-php-extension-installer
RUN apt-get update && \
    apt-get install -y libpq-dev libzip-dev && \
    pecl install redis-6.0.2 && \
    docker-php-ext-install pdo_pgsql mysqli pdo pdo_mysql zip pcntl && \
    docker-php-ext-enable redis mysqli pdo pdo_mysql && \
    rm -rf /var/lib/apt/lists/*

# Install GD
RUN apt-get update && apt-get install -y libjpeg-dev libpng-dev libwebp-dev libfreetype-dev && \
    docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype && \
    docker-php-ext-install gd && \
    rm -rf /var/lib/apt/lists/*
