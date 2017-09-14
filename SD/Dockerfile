# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
ARG app_name
RUN mkdir /apps
COPY composer.json /apps/$app_name/composer.json
# 安装SD框架
RUN cd /apps/$app_name && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y

CMD ["php","/apps/$app_name/bin/start_swoole_server.php","start"]