# start from the latest version of the Debian operating system
FROM debian:10.12
# update the package repository and install mariadb-server [no cache]
RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y
# copy mysql configuration file && starting file for automatic database creation
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start.sh /start.sh
# expose the port 3306
EXPOSE 3306
ENTRYPOINT ["sh", "start.sh"]