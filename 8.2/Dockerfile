FROM php:8.2-apache

WORKDIR /var/www/html

# Install the PostgreSQL PDO extension
# Docs: https://github.com/mlocati/docker-php-extension-installer
RUN apt-get update && \
    apt-get install -y libpq-dev libzip-dev && \
    docker-php-ext-install pdo_pgsql zip 

# Install the latest Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/bin/ --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install the latest NodeJS
RUN curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh | bash && \
    apt install -y nodejs

# Configure the default site
COPY ./8.2/000-default.conf /etc/apache2/sites-available/000-default.conf
