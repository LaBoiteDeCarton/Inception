install:
	sudo apt-get install docker.io
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

build:
	cd srcs && docker-compose build -d

run:
	mkdir /home/dmercadi/data
	mkdir /home/dmercadi/data/db /home/dmercadi/data/wordpress
	cd srcs	&& docker-compose up -d
# run:
# 	docker-compose -f srcs/docker-compose.yml up -d

clean:
	cd srcs && docker-compose down

fclean:
	cd srcs && docker-compose down
	docker system prune -a
	rm -rf /home/dmercadi/data

stop:
	cd srcs && docker-compose stop -d

reload:
	cd srcs && docker-compose start

re: clean build

.PHONY: run clean stop reload