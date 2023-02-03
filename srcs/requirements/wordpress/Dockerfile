# start from the latest version of the Debian operating system
FROM debian:10.12

# update the package repository
RUN apt-get update && apt-get install -y wget \
php7.3 \
php-fpm \
php-mysql \
mariadb-client

# downloading wordpress v6.0 []
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# de-taring wordpress and deleting tar file
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# Making sure to have all permissions on the wordpress for root
RUN		chown -R root:root /var/www/wordpress
# download CLI and place as a binary
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wordpress_config.sh .

RUN chmod 777 wordpress_config.sh

EXPOSE 3306 9000

ENTRYPOINT [ "sh", "wordpress_config.sh"]