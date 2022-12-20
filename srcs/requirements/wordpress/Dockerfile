# start from the latest version of the Debian operating system
FROM debian:10.12

# update the package repository
RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://wordpress.org/latest.zip && unzip latest.zip

