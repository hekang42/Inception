FROM	debian:buster
LABEL	maintainer="hekang@student.42seoul.kr"

RUN		apt update && apt install -y \
			mariadb-server

#COPY	./conf/www.conf			./tmp
COPY	./conf/50-server.cnf	./tmp
COPY	./tools/setup.sh		./tmp

EXPOSE	3306

RUN		/bin/bash
#CMD		bash setup.sh
