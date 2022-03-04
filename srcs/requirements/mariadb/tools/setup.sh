#!/bin/bash

if [ -e /tmp/50-server.cnf ]; then
	chmod 755 /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
	mv tmp/50-server.cnf			/etc/mysql/mariadb.conf.d/50-server.cnf

	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	service mysql start
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
	mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	mysqladmin -uroot -p$DB_ROOT_PW shutdown
fi
exec mysqld_safe
