#!/bin/bash

if [ -e /tmp/50-server.cnf ]; then
	chmod 755 /var/mysql
	chown -R mysql:mysql /var/mysql
	mv tmp/50-server.cnf			/etc/mysql/mariadb.conf.d/50-server.cnf

	mysql_install_db --user=mysql --datadir=/var/mysql
	service mysql start
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;\
		CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
		GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';\
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
	mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
fi
exec mysqld_safe
