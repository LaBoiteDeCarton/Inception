install:
	sudo apt-get install docker.io
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

build:
	cd srcs && docker-compose build -d

run:
	cd srcs	&& docker-compose up -d
# run:
# 	docker-compose -f srcs/docker-compose.yml up -d

clean:
	cd srcs && docker-compose down
	docker system prune -a

stop:
	cd srcs && docker-compose stop -d

reload:
	cd srcs && docker-compose start

re: clean build

.PHONY: run clean stop reload