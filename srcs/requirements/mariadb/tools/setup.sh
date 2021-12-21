#!/bin/bash

chmod 755 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
cp tmp/50-server.cnf			/etc/mysql/mariadb.conf.d/50-server.cnf

mysql_install_db --user=mysql --datadir=/var/lib/mysql
service mysql start
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'hekang'@'%' IDENTIFIED BY '1234'";
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'hekang'@'%';"

service mysql stop
exec mysqld_safe
