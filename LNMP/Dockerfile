FROM php:7.1-fpm

ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        zlib1g-dev \
        vim \
        libssl-dev \
        unzip \
        wget \
        git \
        make \
        openssh-server \
        subversion \
        supervisor \
        --no-install-recommends \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip opcache bcmath pdo_mysql \
    && cd /home && rm -rf temp && mkdir temp && cd temp \
    && wget https://github.com/swoole/swoole-src/archive/v1.9.19.tar.gz \
    https://github.com/redis/hiredis/archive/v0.13.3.tar.gz \
    https://github.com/phpredis/phpredis/archive/3.1.3.tar.gz \
    && tar -xzvf 3.1.3.tar.gz \
    && tar -xzvf v0.13.3.tar.gz \
    && tar -xzvf v1.9.19.tar.gz \
    && cd /home/temp/hiredis-0.13.3 \
    && make -j && make install && ldconfig \
    && cd /home/temp/swoole-src-1.9.19 \
    && phpize && ./configure --enable-async-redis --enable-openssl && make \
    && make install \
    && pecl install inotify \
    && pecl install ds \
    && pecl install igbinary \
    && cd /home/temp/phpredis-3.1.3 \
    && phpize \
    && ./configure --enable-redis-igbinary \
    && make &&  make install \
    && cd /home/temp \
    && php -r"copy('https://getcomposer.org/installer','composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && rm -rf /home/temp \
    && cd /usr/local/etc/php/conf.d/ \
    && echo extension=igbinary.so>igbinary.ini \
    && echo extension=redis.so>redis.ini \
    && echo extension=inotify.so>inotify.ini \
    && echo extension=swoole.so>swoole.ini \
    && echo extension=ds.so>ds.ini \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && mkdir -p /var/log/supervisor \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    #添加ssh用户
    && useradd admin \
    && echo 'root:123456' | chpasswd \
    && /etc/init.d/ssh restart

COPY ./config/* /usr/local/etc/php/conf.d/

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add application
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY src/ /var/www/html/

EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

#启动服务
CMD ["/usr/sbin/sshd","-D"]