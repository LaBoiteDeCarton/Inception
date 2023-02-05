PATH_YML = ./srcs/docker-compose.yml

all:
	@mkdir -p /home/dmercadi/data
	@mkdir -p /home/dmercadi/data/wordpress
	@mkdir -p /home/dmercadi/data/mariadb
	@sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf /home/dmercadi/data/wordpress
	@sudo rm -rf /home/dmercadi/data/mariadb
	@sudo docker system prune -af
