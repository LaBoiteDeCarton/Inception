FROM debian:10.12
RUN apt-get update
RUN apt install -y mariadb-server
# RUN sudo systemctl start mariadb && sudo systemctl enable mariadb
RUN service mysql enable && service mysql start && mysql -e "CREATE DATABASE mydatabase; CREATE USER 'su'@'%' IDENTIFIED BY 'mypassword'; GRANT ALL PRIVILEGES ON *.* TO 'su'@'%'; FLUSH PRIVILEGES;"

EXPOSE 3306
# COPY conf/config.sh config.sh
ENTRYPOINT [ "mysqld" ]