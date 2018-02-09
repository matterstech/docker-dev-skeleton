FROM php:7.1-fpm

RUN apt-get update -qq \
    && apt-get install -y gettext-base openssh-client wget git make cmake libssl-dev libssl-doc libxml2-dev libcurl3-dev --no-install-recommends \
    && pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && docker-php-ext-install -j$(nproc) zip bcmath mbstring xml curl \
    && curl -sS http://getcomposer.org/installer | php -- --filename=composer \
    && chmod a+x composer \
    && mv composer /usr/local/bin/composer \
    && composer -q global require "hirak/prestissimo:^0.3" \
    && composer -q global require "phing/phing:^2.16" \
    && ln -s /root/.composer/vendor/phing/phing/bin/phing /usr/bin/phing \
    && apt-get clean \
    && mkdir /nginx \
    && rm -rf /var/lib/apt/lists/* \
    && cd -

COPY ./config/ /docker/
ADD config/custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini

ENTRYPOINT ["/bin/bash", "/docker/entrypoint.sh"]
CMD ["php-fpm"]

# @TODO create docker user, & set uui & guuid
