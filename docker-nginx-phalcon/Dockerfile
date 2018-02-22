FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y install git nginx nginx-extras php7.0-dev php7.0-fpm libpcre3-dev gcc make php7.0-mysql
RUN mkdir /var/www
RUN echo "<?php phpinfo(); ?>" > /var/www/index.php

RUN git clone --depth=1 http://github.com/phalcon/cphalcon.git
RUN cd cphalcon/build && ./install;

RUN echo 'extension=phalcon.so' >> /etc/php/7.0/fpm/conf.d/30-phalcon.ini
RUN echo 'extension=phalcon.so' >> /etc/php/7.0/cli/conf.d/30-phalcon.ini

ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-enabled/default-ssl

ADD server.crt /etc/nginx/ssl/
ADD server.key /etc/nginx/ssl/

EXPOSE 80

CMD service php7.0-fpm start && nginx
