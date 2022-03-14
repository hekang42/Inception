NAME = inception
DB=/Users/hekang/Inception/db
WP=/Users/hekang/Inception/wp
COMPOSE=docker-compose -p inception -f srcs/docker-compose.yaml

all: clean
	mkdir -p $(DB)
	mkdir -p $(WP)
	$(COMPOSE) up -d;

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

.PHONY: up down volrm clean fclean all
