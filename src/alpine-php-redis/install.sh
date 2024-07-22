#!/bin/sh

set -e

echo "Activating feature 'alpine-php-redis'"

# PHP EXTENSIONS
apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS unixodbc-dev pcre-dev
pecl install redis
docker-php-ext-enable redis

apk del .phpize-deps

echo 'Done!'
