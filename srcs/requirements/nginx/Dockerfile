# start from the latest version of the Debian operating system
FROM debian:10.12

# update the package repository and install Nginx, Openssl
RUN apt-get update
RUN	apt-get install -y nginx openssl
# create a new ssl certificate
RUN mkdir /etc/nginx/ssl && openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/MyCertificate.crt -keyout /etc/nginx/ssl/MyKey.key -subj "/C=FR/ST=PACA/L=Menton/O=42Nice/OU=42Nice.Inception/CN=dmercadi.com"

# # copy the Nginx configuration file
COPY /conf/nginx.conf /etc/nginx/conf.d/site.conf

# Volume le meme que wordpress
# VOLUME geré dans docker-compose

# delete 80 in futur
EXPOSE 443 9000 80

CMD ["nginx", "-g", "daemon off;"]
