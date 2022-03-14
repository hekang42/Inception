NAME = inception
DB=/home/hekang/data/wp
WP=/home/hekang/data/db
COMPOSE=docker-compose -p inception -f srcs/docker-compose.yml

all: build up

build: local
	$(COMPOSE) build;

fbuild: 
	$(COMPOSE) build --no-cache

up:
	$(COMPOSE) up -d;

down:
	$(COMPOSE) down;

volrm:
	docker volume prune;

clean: down
	docker system prune -a;

fclean: clean
	sudo rm -rf /home/hekang/data

local:
	mkdir -p /home/hekang/data/wp
	mkdir -p /home/hekang/data/db

.PHONY: up down build fbuild volrm clean fclean all local
