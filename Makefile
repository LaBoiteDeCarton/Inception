DATA_DIR = /home/dmercadi/data

install:
	sudo apt-get install docker.io curl
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

up:
	docker-compose --version || make install
	mkdir -p ${DATA_DIR}
	mkdir -p ${DATA_DIR}/wordpress ${DATA_DIR}/db
	cd srcs	&& docker-compose up -d

build:
	cd srcs	&& docker-compose build

down:
	cd srcs && docker-compose down

clean: down
	docker system prune -af

fclean: clean
	sudo rm -rf ${DATA_DIR}

stop:
	cd srcs && docker-compose stop

start:
	cd srcs && docker-compose start

re: clean run

.PHONY: run clean stop reload