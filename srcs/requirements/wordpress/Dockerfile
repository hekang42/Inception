FROM	debian:buster
LABEL	maintainer="hekang@student.42seoul.kr"

RUN		apt update && apt upgrade && apt install -y \
			php7.3 \
			php-fpm \
			php-cli \
			wget \
			curl \
			php-mysql \
			php-mbstring \
			php-xml \
			sendmail \
			mariadb-client

RUN		wget https://wordpress.org/latest.tar.gz && \
			tar -xvf latest.tar.gz

COPY	./conf/www.conf			./tmp
COPY	./conf/wp-config.php	./tmp
COPY	./tools/setup.sh		./

EXPOSE	9000

RUN		service php7.3-fpm start
CMD		bash setup.sh

