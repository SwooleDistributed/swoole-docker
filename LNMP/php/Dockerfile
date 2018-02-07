FROM php:7.1-fpm

ENV TZ=Asia/Shanghai
COPY sshd_config /etc/ssh/

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
        nginx \
        subversion \
        supervisor \
        --no-install-recommends \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    #添加ssh用户
    && useradd admin \
    && echo 'root:123456' | chpasswd \
    && /etc/init.d/ssh restart

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

#启动服务
CMD ["/usr/sbin/sshd","-D"]