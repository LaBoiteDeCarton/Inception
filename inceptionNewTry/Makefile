install:
	sudo apt-get install docker.io curl
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

run:
	docker-compose --version || make install
	mkdir -p /home/dmercadi/data
	mkdir -p /home/dmercadi/data/wordpress /home/dmercadi/data/mariadb
	cd srcs	&& docker-compose up -d

build:

down:
	cd srcs && docker-compose down

clean: down
	docker system prune -af

fclean: clean
	sudo rm -rf /home/dmercadi/data

stop:
	cd srcs && docker-compose stop

start:
	cd srcs && docker-compose start

re: clean run

.PHONY: run clean stop reload