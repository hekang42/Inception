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
			sendmail \
			mariadb-client \
			sudo

RUN		wget https://wordpress.org/latest.tar.gz && \
			tar -xvf latest.tar.gz

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			chmod +x wp-cli.phar && \
			sudo mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/www.conf			./tmp
COPY	./conf/wp-config.php	./tmp
COPY	./tools/setup.sh		./

EXPOSE	9000

RUN		service php7.3-fpm start
CMD		bash setup.sh

