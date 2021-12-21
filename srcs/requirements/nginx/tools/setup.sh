#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt

cp tmp/default			/etc/nginx/sites-available/default

nginx -g "daemon off;"
