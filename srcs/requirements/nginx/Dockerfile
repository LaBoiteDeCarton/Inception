# start from the latest version of the Debian operating system
FROM debian:10.12

# update the package repository and install Nginx, Openssl
RUN apt-get update
RUN	apt-get install -y nginx openssl
# create a new ssl certificate
RUN mkdir /etc/nginx/ssl && openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/MyCertificate.crt -keyout /etc/nginx/ssl/MyKey.key
# RUN useradd -m nginx

# # copy the Nginx configuration file
# COPY nginx.conf /etc/nginx/nginx.conf
# Volume le meme que wordpress
# VOLUME 

# set the working directory to the user's home directory
# WORKDIR /home/nginx

# expose port 80 for HTTP traffic
EXPOSE 443 9000

COPY /conf/nginx.conf /etc/nginx/nginx.conf

# run the Nginx web server as the nginx user
# USER nginx
CMD ["nginx", "-g", "daemon off;"]
