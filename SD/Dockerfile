# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/peterpang/ssd
MAINTAINER peterpang 10846295@qq.com
RUN mkdir /apps
COPY composer.json /apps/composer.json
# 安装SD框架
RUN cd /apps && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y

CMD ["php","/apps/bin/start_swoole_server.php","start"]