run:
	docker-compose -f srcs/docker-compose.yml -d up

clean:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml -d stop

reload:
	docker-compose -f srcs/docker-compose.yml -d start

.PHONY run clean stop reload