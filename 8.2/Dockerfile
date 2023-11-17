FROM php:8.2-apache

WORKDIR /var/www/html

# Install the PostgreSQL PDO extension
RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo_pgsql

# Configure the default site
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
