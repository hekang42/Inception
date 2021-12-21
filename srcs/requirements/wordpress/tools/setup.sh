#!/bin/bash


mkdir -p /var/www/html && \
cp -r /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html && \
rm -r /wordpress latest.tar.gz

cp tmp/wp-config.php				/var/www/html/wp-config.php
cp tmp/www.conf		/etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 --nodaemonize
