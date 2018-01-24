Build MongoDB PHP Mobule.
---------------------------------------------------

```
docker build -t build/php7mongo:7.2.0 .
```


```
docker run -it --name docker-php7mongo -d build/php7mongo:7.2.0
docker cp docker-php7mongo:/usr/local/etc/php/conf.d/20-mongodb.ini ./../../php7-ini/20-mongodb.ini
docker cp docker-php7mongo:/usr/local/lib/php/extensions/no-debug-non-zts-20170718/mongodb.so ./../../php7-ext/mongodb.so
```


```
docker stop docker-php7mongo && docker rm docker-php7mongo
```