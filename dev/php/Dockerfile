FROM php:7.1-fpm

#RUN apt-get update && apt-get install -y \
#        curl \
#        wget \
#        git \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng12-dev \
#    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring mysqli pdo_mysql zip \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd
#
## Куда же без composer'а.
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install xdebug \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) pdo_mysql gd \
    && docker-php-ext-enable xdebug

COPY docker-entrypoint.sh /usr/local/bin/
COPY zzz-docker.ini /usr/local/etc/php-fpm.d/zzz-docker.conf
COPY zzz-xdebug.ini /usr/local/etc/php/conf.d/zzz-xdebug.ini

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm"]
