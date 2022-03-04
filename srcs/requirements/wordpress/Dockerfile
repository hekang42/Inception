FROM	debian:buster

RUN		apt update && apt install -y \
			php-fpm \
			wget \
			curl \
			php-mysql \
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


ENTRYPOINT [ "/bin/bash" ]
CMD		[ "setup.sh" ]