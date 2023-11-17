FROM php:8.2-cli

WORKDIR /var/www/html

# Add supervisor
RUN apt-get update && apt-get install -y supervisor

# Add a config to run php artisan horizon against the mounted source code and keep that alive
COPY ./8.2-worker/supervisord.conf /etc/supervisor/supervisord.conf

# Run supervisor on start
CMD ["/usr/bin/supervisord"]