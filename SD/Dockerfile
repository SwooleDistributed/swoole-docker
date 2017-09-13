# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY composer.json /home/apps/composer.json
# 安装SD框架
RUN cd /home/apps && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y
CMD ["supervisord"]