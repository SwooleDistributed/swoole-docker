# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN cd /mnt/apps && composer install && php vendor/tmtbe/swooledistributed/src/Install.php -y
#声明端口，和你开启的HTTP，TCP端口保持一致
EXPOSE 8081
EXPOSE 9093
CMD ["supervisord"]