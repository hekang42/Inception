NAME = inception

all: clean build

build:
	cd ./srcs/ && docker-compose up -d;

stop:
	cd ./srcs/ && docker-compose down;

volrm:
	cd ./srcs/ && docker volume prune;

clean: stop
	cd ./srcs/ && docker system prune -a;

fclean: clean
	sudo rm -rf ~/data/;

.PHONY: setup build stop volrm clean fclean all
