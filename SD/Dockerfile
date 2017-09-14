# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
# 安装SD框架
RUN cd /apps && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y

CMD ["php","/apps/SD-demo/bin/start_swoole_server.php","start"]