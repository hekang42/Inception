#!/bin/bash
sleep 10;
if [ ! -e /var/www/html/wp-config.php ]; then

	# mkdir -p /var/www/html 
	cp -r /wordpress/* /var/www/html/
	chown -R www-data:www-data /var/www/html
	rm -r /wordpress latest.tar.gz

	cp tmp/wp-config.php				/var/www/html/wp-config.php
	cp tmp/www.conf		/etc/php/7.3/fpm/pool.d/www.conf

	

	wp core install --allow-root --url=$DOMAIN_NAME --title='WordPress' --admin_user=$WP_USER1\
		--admin_password=$WP_USER1_PW --admin_email="hekang@student.42seoul.kr" --path='/var/www/html'

	wp user create --allow-root $WP_USER2 sushin@student.42seoul.kr --user_pass=$WP_USER2_PW --role=author --path='/var/www/html'

fi
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 --nodaemonize
