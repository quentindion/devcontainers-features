#!/bin/sh

set -e

echo "Activating feature 'alpine-php-mssql'"

# Download the desired package(s)
curl -O https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.3.1-1_amd64.apk
curl -O https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk

#Install the package(s)
apk add --allow-untrusted msodbcsql18_18.3.3.1-1_amd64.apk
apk add --allow-untrusted mssql-tools18_18.3.1.1-1_amd64.apk

# PHP EXTENSIONS
apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS unixodbc-dev
pecl install pdo_sqlsrv
docker-php-ext-enable pdo_sqlsrv

apk del .phpize-deps
rm msodbcsql18_18.3.3.1-1_amd64.apk
rm mssql-tools18_18.3.1.1-1_amd64.apk

echo 'Done!'
