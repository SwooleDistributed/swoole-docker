FROM php:7.1.3-fpm-alpine

RUN \
apk add git autoconf file g++ gcc libc-dev make pkgconf re2c libtool \
check check-dev cyrus-sasl-dev libsodium-dev libssh2-dev imagemagick-dev yaml-dev --no-cache && \
cd ~ && git clone git://github.com/phalcon/cphalcon.git && \
cd ~/cphalcon && git checkout v3.1.2 && \
cd ~/cphalcon/build && ./install && \
docker-php-ext-enable phalcon && \
rm -rf ~/cphalcon && \
apk del git autoconf make m4 perl g++ gcc \
musl-dev libc-dev check-dev cyrus-sasl-dev libsodium-dev libssh2-dev yaml-dev openssl-dev imagemagick-dev zlib-dev


VOLUME ["/var/www/html"]