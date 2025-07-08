FROM php:8.1-fpm-alpine

RUN apk add --no-cache \
    bash git curl zip unzip icu-dev libxml2-dev libzip-dev \
    mariadb-dev rabbitmq-c-dev linux-headers \
    libpng-dev libjpeg-turbo-dev libwebp-dev libxpm-dev freetype-dev \
    libsodium libsodium-dev \
    $PHPIZE_DEPS \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
        --with-xpm \
    && docker-php-ext-install pdo_mysql zip intl soap xml opcache gd sodium \
    && pecl install redis xdebug amqp \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && echo "extension=amqp.so" > /usr/local/etc/php/conf.d/amqp.ini \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && rm -rf /var/cache/apk/*

WORKDIR /var/www/html

CMD ["php-fpm"]

