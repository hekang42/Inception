NAME = inception
DB=/Users/hekang/Inception/db
WP=/Users/hekang/Inception/wp
COMPOSE=docker-compose -p inception -f srcs/docker-compose.yaml

all: build up

build: 
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
	rm -rf $(WP)
	rm -rf $(DB)

.PHONY: up down build fbuild volrm clean fclean all
