FROM ubuntu:16.04

MAINTAINER peterpang 10846295@qq.com 
# 构建swoole环境，在这里安装了php,swoole,composer
COPY sshd_config /etc/ssh/

ENV DEBIAN_FRONTEND noninteractive

## Install php nginx mysql supervisor
RUN apt update && \
    apt install -y php7.0-fpm php7.0-mysql php7.0-gd php7.0-mcrypt php7.0-mysql php7.0-curl \
	php7.0-phalcon \
	nginx \
	curl \
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
    #添加ssh用户
	&& useradd admin \
	&& echo 'root:123456' | chpasswd \
	&& /etc/init.d/ssh restart

## Configuration
RUN sed -i 's/^listen\s*=.*$/listen = 127.0.0.1:9000/' /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cgi.log/' /etc/php/7.0/fpm/php.ini && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cli.log/' /etc/php/7.0/cli/php.ini && \
COPY files/root /

WORKDIR /var/www/

VOLUME ["/var/www/"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh", "/usr/sbin/sshd","-D"]
