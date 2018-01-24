Build PHP Mobule with Phalcon Framework v3.3.x
---------------------------------------------------

```
docker build -t build/php7phalcon:7.2.0 .
```


```
docker run -it --name docker-php7phalcon -d build/php7phalcon:7.2.0
docker cp docker-php7phalcon:/usr/local/etc/php/conf.d/20-phalcon.ini ./../../php7-ini/20-phalcon.ini
docker cp docker-php7phalcon:/usr/local/lib/php/extensions/no-debug-non-zts-20170718/phalcon.so ./../../php7-ext/phalcon.so
```


```
docker stop docker-php7phalcon && docker rm docker-php7phalcon
```