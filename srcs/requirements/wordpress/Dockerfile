FROM	debian:buster
LABEL	maintainer="hekang@student.42seoul.kr"

RUN		apt update && apt install -y \
			php7.3 \
			php-fpm \
			php-cli \
			wget \
			curl \
			php-mysql \
			php-mbstring \
			php-xml \
			sendmail

RUN		wget https://wordpress.org/latest.tar.gz && \
			tar -xvf latest.tar.gz && \
			mkdir -p /var/www/html && \
			mv /wordpress/* /var/www/html/ && \
			chown -R www-data:www-data /var/www/html && \
			rm -r /wordpress latest.tar.gz



COPY	./conf/www.conf			./tmp
COPY	./conf/wp-config.php	./tmp
COPY	./tools/setup.sh		./

EXPOSE	9000
CMD		bash setup.sh
