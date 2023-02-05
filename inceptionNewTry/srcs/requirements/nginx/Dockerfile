# start from the latest stable version of the Debian operating system
FROM debian:10.12

# update the package repository and install Nginx, Openssl [no cache]
RUN apt-get update && apt-get upgrade -y && apt install nginx openssl -y
# create a new ssl certificate
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
-out /etc/ssl/MyCert.crt \
-keyout /etc/ssl/MyKey.key \
-subj "/C=FR/ST=PACA/L=NICE/O=42/OU=42/CN=dmercadi.42.fr/UID=dmercadi"

# # copy the Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# launching nginx, daemon
CMD [ "nginx", "-g", "daemon off;" ]
