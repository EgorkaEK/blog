#!/bin/sh
set -e

cd /var/www/html

# Install dependencies if vendor doesn't exist
if [ ! -d "vendor" ]; then
    echo "Running composer install..."
    composer install --no-interaction --prefer-dist --optimize-autoloader
fi

# Fix upload dir permissions
mkdir -p public/images/uploads
chown -R www-data:www-data public/images/uploads storage

exec php-fpm
