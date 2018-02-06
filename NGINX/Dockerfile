# sd-swoole
FROM php:7.0.5-fpm

MAINTAINER peterpang 10846295@qq.com
# 构建swoole环境，在这里安装了php,swoole,composer
COPY sshd_config /etc/ssh/
RUN apt-get update && apt-get install -y \
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

    #添加ssh用户
	&& useradd admin \
	&& echo 'root:123456' | chpasswd \
	&& /etc/init.d/ssh restart

COPY ./config/* /usr/local/etc/php/conf.d/

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

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