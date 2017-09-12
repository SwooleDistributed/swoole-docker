# sd-swoole
FROM registry-internal.cn-hangzhou.aliyuncs.com/youwoxing/php
MAINTAINER Jincheng Zhang 896369042@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer
RUN apt-get update && apt-get install -y \
	zlib1g-dev \
	wget \
	composer \
	make \
	supervisor \
	--no-install-recommends \
	&& cd /home && mkdir temp && cd temp \
	&& wget https://github.com/swoole/swoole-src/archive/v1.9.20.tar.gz \
	https://github.com/redis/hiredis/archive/v0.13.3.tar.gz \
	https://github.com/phpredis/phpredis/archive/3.1.3.tar.gz \ --no-check-certificate \
	&& tar -xzvf phpredis-3.1.3.tgz.gz \
	&& tar -xzvf v0.13.3.tar.gz \
	&& tar -xzvf v1.9.20.tar.gz \
	&& cd /home/temp/hiredis-0.13.3 \
	&& make -j && make install && ldconfig \
	&& cd /home/temp/swoole-src-1.9.20 \
	&& phpize && ./configure --enable-async-redis --enable-openssl && make \
	&& make install \
	&& pecl install inotify \
	&& pecl install igbinary \
	&& pecl install ds \
	&& cd /home/temp/phpredis-3.1.3 \
	&& ./configure --enable-redis-igbinary \
	&& make &&  make install \
	&& rm -rf temp \
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
    && rm -rf /var/lib/apt/lists/*

