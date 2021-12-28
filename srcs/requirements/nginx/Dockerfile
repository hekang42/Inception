FROM	debian:buster

RUN		apt update && apt install -y \
		nginx \
		openssl


COPY	./tools/setup.sh			./
COPY	./conf/default			./tmp
#COPY	./srcs/wp-config.php	./tmp
#COPY	./srcs/config.inc.php	./tmp

EXPOSE	443

ENTRYPOINT [ "/bin/bash" ]
CMD		[ "setup.sh" ]