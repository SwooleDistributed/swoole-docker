# sd-swoole
FROM ubuntu
MAINTAINER Jincheng Zhang 896369042@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer
RUN apt-get update && apt-get install -y \
	php7.1-cli \
	php7.1-dev \
	php7.1-mbstring \
	php7.1-xml \
	php7.1-mysql \
	php7.1-bcmath \
	php-pear \
	zlib1g-dev \
	wget \
	unzip \
	composer \
	make \
	git \
	supervisor \
	--no-install-recommends \
	&& cd /home && mkdir temp && cd temp \
	&& wget https://github.com/swoole/swoole-src/archive/v1.9.19.tar.gz \
	https://github.com/redis/hiredis/archive/v0.13.3.tar.gz --no-check-certificate \
	&& tar -xzvf v0.13.3.tar.gz \
	&& tar -xzvf v1.9.19.tar.gz \
	&& cd hiredis-0.13.3 \
	&& make -j && make install && ldconfig \
	&& cd ../swoole-src-1.9.19 \
	&& phpize && ./configure --enable-async-redis --enable-openssl && make \
	&& make install \
	&& cd /home && rm -rf temp \
	&& pecl install inotify \
	&& pecl install redis \
	&& pecl install ds \
	&& cd /etc/php/7.0/cli/conf.d \
	&& echo extension=redis.so>redis.ini \
	&& echo extension=inotify.so>inotify.ini \
	&& echo extension=swoole.so>swoole.ini \
	&& echo extension=ds.so>ds.ini \
	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com \
	&& mkdir -p /var/log/supervisor \
	&& apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

