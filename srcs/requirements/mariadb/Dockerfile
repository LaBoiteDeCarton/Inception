FROM debian:10.12
RUN apt-get update && apt-get install -y mariadb-server

ENV DATABASE_NAME=$DATABASE_NAME
ENV DATABASE_USER=$DATABASE_USER
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

RUN sed -i 's!#port!port !g' /etc/mysql/mariadb.conf.d/50-server.cnf; sed -i 's!127.0.0.1!0.0.0.0!g' /etc/mysql/mariadb.conf.d/50-server.cnf;

COPY conf/config.sh .
RUN chmod 777 config.sh && sh config.sh && rm config.sh
#RUN service mysql start && mysql -e "CREATE DATABASE mydatabase; CREATE USER 'su'@'%' IDENTIFIED BY 'mypassword'; GRANT ALL PRIVILEGES ON *.* TO 'su'@'%'; FLUSH PRIVILEGES;" && service mysql stop
EXPOSE 3306
ENTRYPOINT [ "mysqld" ]