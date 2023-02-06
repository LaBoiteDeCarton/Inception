DATA_DIR = /home/dmercadi/data

all:
	@echo "make install	: install docker & docker-compose"
	@echo "make prepare	: check docker-compose installation & create directory for volumes"
	@echo "make up		: build and run dockers"
	@echo "make build	: build dockers"
	@echo "make stop	: stopping dockers"
	@echo "make start	: start stopped dockers"
	@echo "make down	: stop and rm dockers"
	@echo "make clean	: removing all images"
	@echo "make fclean	: removing all images and volumes data"

install:
	@sudo apt-get install docker.io curl && echo "Docker.io and curl installed" || echo "Failed to install Docker.io or curl"
	@sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && echo "docker-compose downloaded" || echo "Failed to download docker-compose"
	@sudo chmod +x /usr/local/bin/docker-compose

prepare:
	@docker-compose --version || make install
	@mkdir -p ${DATA_DIR}
	@mkdir -p ${DATA_DIR}/wordpress ${DATA_DIR}/db

up: prepare
	cd srcs	&& docker-compose up -d

build: prepare
	cd srcs	&& docker-compose build

stop:
	cd srcs && docker-compose stop

start:
	cd srcs && docker-compose start

down:
	cd srcs && docker-compose down

clean: down
	docker system prune -af

fclean: clean
	sudo rm -rf ${DATA_DIR}

re: clean up

fre: fclean up

.PHONY: run clean stop reload