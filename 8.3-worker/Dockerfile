FROM php:8.3-cli

WORKDIR /var/www/html

# Create a non-root runtime user with group 33 (apache's www-data group)
RUN groupadd --force -g 33 runtime
RUN useradd -ms /bin/bash --no-user-group -g 33 -u 1337 runtime

# Add supervisor
RUN apt-get update && apt-get install -y supervisor

# Add a config to run php artisan horizon against the mounted source code and keep that alive
COPY ./8.3-worker/supervisord.conf /etc/supervisor/supervisord.conf

# Run supervisor on start
CMD ["/usr/bin/supervisord"]