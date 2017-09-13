# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
COPY composer.json /home/apps/composer.json
# 安装SD框架
RUN cd /home/apps && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y
CMD ["php","/home/apps/bin/start_swoole_server.php","start"]