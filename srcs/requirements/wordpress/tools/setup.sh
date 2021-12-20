#!/bin/bash

mv tmp/www.conf				/var/www/html/wp-config.php
mv tmp/wp-config.php		/etc/php/7.3/fpm/pool.d/

wordpress -g "daemon off;"
