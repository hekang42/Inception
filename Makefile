NAME = inception
DB=~/data/wp
WP=~/data/db
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
	sudo rm -rf ~/data

local:
	mkdir -p ~/data/wp
	mkdir -p ~/data/db

.PHONY: up down build fbuild volrm clean fclean all local
