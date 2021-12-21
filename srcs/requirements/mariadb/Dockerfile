FROM	debian:buster
LABEL	maintainer="hekang@student.42seoul.kr"

RUN		apt update && apt install -y \
			mariadb-server \
			procps

COPY	./conf/50-server.cnf	./tmp
COPY	./tools/setup.sh		./

EXPOSE	3306
CMD		bash setup.sh

