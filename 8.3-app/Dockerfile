FROM php:8.3-apache

WORKDIR /var/www/html

# Install the PostgreSQL PDO extension
# Docs: https://github.com/mlocati/docker-php-extension-installer
RUN apt-get update && \
    apt-get install -y libpq-dev libzip-dev && \
    pecl install redis-6.0.2 && \
    docker-php-ext-install pdo_pgsql zip pcntl && \
    docker-php-ext-enable redis

# Install GD
RUN apt-get install -y libjpeg-dev libpng-dev libwebp-dev libfreetype-dev && \
    docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype && \
    docker-php-ext-install gd

# Install the latest Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/bin/ --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install NodeJS and NPM
RUN apt update && \
    apt install -y ca-certificates curl gnupg && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_MAJOR=20 && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt update && \
    apt install -y nodejs

# Configure the default site
COPY ./8.3-app/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# Create a non-root runtime user with group 33 (apache's www-data group)
RUN groupadd --force -g 33 runtime
RUN useradd -ms /bin/bash --no-user-group -g 33 -u 1337 runtime
