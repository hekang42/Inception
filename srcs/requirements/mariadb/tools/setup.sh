#!/bin/bash

mv tmp/50-server.cnf			/etc/mysql/mariadb.conf.d/50-server.cnf
mariadb -g "daemon off;"
