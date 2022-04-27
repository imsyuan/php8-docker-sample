FROM php:8.1-rc-apache

RUN echo 'Hi from docker' > index.php

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ports.conf /etc/apache2/ports.conf

WORKDIR /var/www/html

EXPOSE 8888

CMD ["apache2-foreground"]