FROM ubuntu:18.04

LABEL maintiner=steven.chang

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Taipei
WORKDIR /var/www/html

RUN echo 'Hi from docker' > /var/www/html/index.php

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get install -yq --no-install-recommends apt-utils && \
    apt-get install -yq --no-install-recommends \
    curl \
    # vim
    vim \
    # Install apache
    apache2 \
    # Install php 7.4
    php7.4 \
    libapache2-mod-php7.4 \
    php7.4-cli \
    php7.4-json \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-xml \
    php7.4-zip \
    php7.4-memcached \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername
# Configure vhost for apache2
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ports.conf /etc/apache2/ports.conf

# 調整 Apache2 ports
RUN chown -R www-data:www-data /var/log/apache2
RUN chown -R www-data:www-data /var/run/apache2
RUN chmod -R 777 /var/log/apache2
RUN chmod -R 777 /var/run/apache2
RUN chmod -R a+w /var/log/apache2

EXPOSE 8080

WORKDIR /var/www/html

CMD apachectl -D FOREGROUND