FROM ubuntu:16.04

MAINTAINER peterpang 10846295@qq.com 
# 构建swoole环境，在这里安装了php,swoole,composer
COPY sshd_config /etc/ssh/

ENV DEBIAN_FRONTEND noninteractive

## Install php nginx mysql supervisor
RUN apt update && \
    apt install -y php7.1-fpm php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-mysql php7.1-curl \
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
    echo "mysql-server mysql-server/root_password password" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password" | debconf-set-selections && \
    apt install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

## Configuration
RUN sed -i 's/^listen\s*=.*$/listen = 127.0.0.1:9000/' /etc/php/7.1/fpm/pool.d/www.conf && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cgi.log/' /etc/php/7.1/fpm/php.ini && \
    sed -i 's/^\;error_log\s*=\s*syslog\s*$/error_log = \/var\/log\/php\/cli.log/' /etc/php/7.1/cli/php.ini && \
    sed -i 's/^key_buffer\s*=/key_buffer_size =/' /etc/mysql/my.cnf

COPY files/root /

WORKDIR /var/www/

VOLUME ["/var/www/", "/var/lib/mysql/"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
