# start from the latest stable version of the Debian operating system
FROM debian:10.12

# update the package repository && install wget utility
RUN apt-get update && apt-get upgrade -y && apt-get -y install wget
# Installing php utility
RUN apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client
# downloading wordpress v6.1 [11.11.22]
RUN wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www
# de-taring wordpress and deleting tar file
RUN cd /var/www && tar -xzf wordpress-6.1-fr_FR.tar.gz && rm wordpress-6.1-fr_FR.tar.gz
# Making sure to have all permissions on the wordpress for root
RUN	chown -R root:root /var/www/wordpress
# download CLI and place as a binary
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
# copying config file for php && wp configuration to start the docker
COPY	./conf/php.conf	/etc/php/7.3/fpm/pool.d/www.conf
COPY	conf/wordpress_config.sh wordpress_config.sh
# just in case
RUN chmod +x wordpress_config.sh

ENTRYPOINT ["sh", "wordpress_config.sh"]