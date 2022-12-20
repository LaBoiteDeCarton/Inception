FROM debian:10.12
RUN sudo apt-get update
RUN sudo apt install -y mariadb-server
# RUN sudo systemctl start mariadb && sudo systemctl enable mariadb
RUN mysql -e "CREATE DATABASE mydatabase; CREATE USER 'su'@'%' IDENTIFIED BY 'mypassword'; GRANT ALL PRIVILEGES ON *.* TO 'su'@'%'; FLUSH PRIVILEGES;"

EXPOSE 3306
# COPY conf/config.sh config.sh
ENTRYPOINT [ "mysqld" ]