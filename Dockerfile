# sd-swoole
FROM ubuntu
MAINTAINER Jincheng Zhang 896369042@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer,redis
COPY sshd_config /etc/ssh/
RUN apt-get update && apt-get install -y \
	redis-server \
	php7.0-cli \
	php7.0-dev \
	php7.0-mbstring \
	php-pear \
	zlib1g-dev \
	wget \
	unzip \
	composer \
	make \
	git \
	supervisor \
	openssh-server \
	vim \
	--no-install-recommends \
	&& cd /home && mkdir temp && cd temp \
	&& wget https://github.com/swoole/swoole-src/archive/v1.9.8.tar.gz \
	https://github.com/redis/hiredis/archive/v0.13.3.tar.gz --enable-openssl --no-check-certificate \
	&& tar -xzvf v0.13.3.tar.gz \
	&& tar -xzvf v1.9.8.tar.gz \
	&& cd hiredis-0.13.3 \
	&& make -j && make install && ldconfig \
	&& cd ../swoole-src-1.9.8 \
	&& phpize && ./configure --enable-async-redis && make -j \
	&& make install \
	&& cd /home && rm -rf temp \
	&& pecl install inotify \
	&& pecl install redis \
	&& cd /etc/php/7.0/cli/conf.d \
	&& echo extension=redis.so>redis.ini \
	&& echo extension=inotify.so>inotify.ini \
	&& echo extension=swoole.so>swoole.ini \
	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com \
	&& mkdir -p /var/log/supervisor \
#添加ssh用户
	&& useradd admin \
	&& echo 'root:123' | chpasswd \
	&& /etc/init.d/ssh restart

#SD端口
EXPOSE 8081
EXPOSE 9093
#ssh端口
EXPOSE 22
#mysql端口
EXPOSE 3360
#redis端口
EXPOSE 6379

#启动服务
CMD ["/usr/sbin/sshd","-D"]
