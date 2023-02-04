install:
	sudo apt-get install docker.io
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

all:
	@mkdir -p /home/mprigent/data
	@mkdir -p /home/mprigent/data/wordpress
	@mkdir -p /home/mprigent/data/mariadb
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

re: clean all

stop:
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

clean: stop
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	@sudo rm -rf /home/mprigent/data/wordpress
	@sudo rm -rf /home/mprigent/data/mariadb
	@sudo docker system prune -af
