FROM php:7.2.0-fpm
LABEL peterpang <10846295@qq.com>
COPY sshd_config /etc/ssh/

RUN apt-get update && apt-get install -y \
    curl \
    git \
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
    && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql mbstring zip opcache bcmath \
    && apt-get clean && apt-get autoremove \
    && rm -r /var/lib/apt/lists/* && rm -rf /tmp/* /var/tmp/* \
    #添加ssh用户
	&& useradd admin \
	&& echo 'root:123' | chpasswd \
	&& /etc/init.d/ssh restart


COPY ./php7-ini/20-phalcon.ini /usr/local/etc/php/conf.d/20-phalcon.ini
COPY ./php7-ini/20-mongodb.ini /usr/local/etc/php/conf.d/20-mongodb.ini
COPY ./php7-ext/phalcon-v3.3.0.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/phalcon-v3.3.0.so
COPY ./php7-ext/mongodb-v1.3.4.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/mongodb-v1.3.4.so

WORKDIR /usr/share/nginx/html
#EXPOSE 80

CMD ["php-fpm"]
#启动服务
CMD ["/usr/sbin/sshd","-D"]