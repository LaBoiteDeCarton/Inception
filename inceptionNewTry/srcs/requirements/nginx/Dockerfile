FROM debian:10.12

RUN apt-get update && apt-get upgrade -y && apt install nginx -y
RUN apt-get install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
-subj "/C=FR/ST=PACA/L=NICE/O=42/OU=42/CN=dmercadi.42.fr/UID=dmercadi" \
-out /etc/ssl/MyCert.crt \
-keyout /etc/ssl/MyKey.key
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]
