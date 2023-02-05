FROM debian:10.12
RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/start.sh /start.sh
ENTRYPOINT ["sh", "start.sh"]
EXPOSE 3306