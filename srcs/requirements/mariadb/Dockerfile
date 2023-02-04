FROM debian:10.12
RUN apt-get update && apt-get install -y mariadb-server
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start.sh /start.sh
# RUN chmod +x start.sh
ENTRYPOINT [ "sh", "start.sh" ]
EXPOSE 3306