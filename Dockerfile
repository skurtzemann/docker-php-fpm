FROM ubuntu:14.04

## Install tools
RUN apt-get update && \
    apt-get install supervisor -y 

## Install php
ENV DEBIAN_FRONTEND noninteractive
ENV PHP_VERSION 5
RUN apt-get update && \
	apt-get install -y php5-cli php5-fpm php5-curl php5-gd php5-mcrypt

## Configure php
# (https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-14-04)
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini &&\
	mkdir -p /var/log/php5-fpm/
ADD config/ /etc/php5/fpm/

## Docker config
CMD ["php5-fpm"]