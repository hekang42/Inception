#!/bin/bash

until mysql --host=mariadb --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 1
done

  echo >&2 "mariadb is available - done"

if ! wp core is-installed --path='/var/www/html' --allow-root; then
	# service php7.3-fpm start
	cp -r /wordpress/* /var/www/html/
	chown -R www-data:www-data /var/www/html
	rm -r /wordpress latest.tar.gz

  	wp config create --allow-root  --path='/var/www/html' \
		--dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb \
		--locale=ko_KR
	wp core install --allow-root --url=$DOMAIN_NAME --title='WordPress' --admin_user=$WP_USER1\
		--admin_password=$WP_USER1_PW --admin_email="hekang@student.42seoul.kr" --path='/var/www/html'

	wp user create --allow-root $WP_USER2 sushin@student.42seoul.kr --user_pass=$WP_USER2_PW --role=author --path='/var/www/html'
	# service php7.3-fpm stop
fi

service php7.3-fpm start
service php7.3-fpm stop

exec php-fpm7.3 --nodaemonize
