# start from the latest version of the Debian operating system
FROM debian:10.12

# update the package repository and install Nginx, Openssl [no cache]
RUN apt-get update && apt-get install -y nginx openssl
# create a new ssl certificate
RUN mkdir -p /etc/nginx/ssl && openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/MyCertificate.crt -keyout /etc/nginx/ssl/MyKey.key -subj "/C=FR/ST=PACA/L=Menton/O=42Nice/OU=42Nice.Inception/CN=dmercadi.42.fr"

# # copy the Nginx configuration file
COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Volume le meme que wordpress
# VOLUME geré dans docker-compose

CMD ["nginx", "-g", "daemon off;"]
