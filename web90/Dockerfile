FROM php:8.2-apache
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nano
RUN apt-get -y install postgresql
RUN apt-get install libpq-dev
# install php
RUN docker-php-ext-install pgsql 
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pdo_mysql

# RUN pecl install xdebug \
#     && docker-php-ext-enable xdebug \
#     && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#     && echo "xdebug.mode=debug,profile" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#     && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#     && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#     && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" >> /usr/local/etc/php/php.ini-development \
#     && echo "xdebug.mode=debug,profile" >> /usr/local/etc/php/php.ini-development \
#     && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/php.ini-development \
#     && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/php.ini-development \
#     && echo "xdebug.client_port=9003" >> /usr/local/etc/php/php.ini-development \
# RUN apt-get -y install php-xdebug
# RUN postgres "psql -h postgres -U postgres -f {/var/lib/postgresql/data}"