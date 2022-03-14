FROM	debian:buster

RUN		apt update && apt install -y \
			mariadb-server \
			procps

COPY	./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/setup.sh		./

EXPOSE	3306

ENTRYPOINT [ "/bin/bash" ]
CMD		[ "setup.sh" ]
