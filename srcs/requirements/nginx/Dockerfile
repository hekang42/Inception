FROM	debian:buster
LABEL	maintainer="hekang@student.42seoul.kr"

RUN		apt update && apt install -y \
		nginx \
		openssl


COPY	./tools/setup.sh			./
COPY	./conf/default			./tmp
#COPY	./srcs/wp-config.php	./tmp
#COPY	./srcs/config.inc.php	./tmp

EXPOSE	443
CMD		bash setup.sh
