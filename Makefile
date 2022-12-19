run:
	docker-compose -f srcs/docker-compose.yml up -d

clean:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml stop -d

reload:
	docker-compose -f srcs/docker-compose.yml start -d

.PHONY: run clean stop reload