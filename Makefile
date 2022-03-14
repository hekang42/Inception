NAME = inception
DB=/Users/hekang/Inception/db
WP=/Users/hekang/Inception/wp

all: clean build

build:
	mkdir -p $(DB)
	mkdir -p $(WP)
	cd ./srcs/ && docker-compose up -d;

stop:
	cd ./srcs/ && docker-compose down;

volrm:
	cd ./srcs/ && docker volume prune;

clean: stop
	cd ./srcs/ && docker system prune -a;

fclean: clean
	rm -rf $(WP)
	rm -rf $(DB)

.PHONY: setup build stop volrm clean fclean all
