
all: up

up:
	@mkdir -p /home/ambre/data/mysql
	@mkdir -p /home/ambre/data/wordpress
	@docker compose -f srcs/docker-compose.yml up --build

clean: stop
	docker system prune -a -f --volumes

clear: clean
	docker volume rm srcs_wordpress srcs_mariadb
	@rm -rf /home/ambre/data

stop:
	docker compose -f srcs/docker-compose.yml down

re: clean all

enter_mariadb:
	@cd ./srcs && docker exec -it mariadb sh

enter_nginx:
	@cd ./srcs && docker exec -it nginx sh

enter_wordpress:
	@cd ./srcs && docker exec -it wordpress sh

show:
	docker ps
	docker volume ls -q
	docker container ls -q

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx


.PHONY: up clean clear stop re enter_mariadb enter_nginx enter_wordpress show logs