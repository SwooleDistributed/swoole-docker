# sd-swoole
FROM registry.cn-hangzhou.aliyuncs.com/youwoxing/swoole
MAINTAINER Jincheng Zhang 896369042@qq.com
# 安装SD框架
RUN cd /apps && composer install

CMD ["php","/apps/bin/start_swoole_server.php","start"]