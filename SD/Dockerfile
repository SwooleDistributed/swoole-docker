# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
# 安装SD框架
RUN cd /home/apps && wget https://github.com/tmtbe/SwooleDistributed/archive/2.4.15.tar.gz \
    && tar -xzvf 2.4.15.tar.gz &&cd /home/apps/SwooleDistributed-2.4.15 && composer install && php src/Install.php -y
COPY define.php /home/apps/SwooleDistributed-2.4.15/bin/define.php
CMD ["php","/home/apps/SwooleDistributed-2.4.15/bin/start_swoole_server.php","start"]