# Nginx + Phalcon

- nginx 
- php5-fpm
- phalcon extension

## Usage:
	docker run -d -v="/pathto/to/your/code":"/var/www" -p 8888:80 alfonso/nginx-phalcon

## Options
### Document root
Additionally you can define the public folder for each instance by passing an env variable called WEBPUBLIC for example adding `-e "WEBPUBLIC=public/es"`

	docker run -d -v="/pathto/to/your/code":"/var/www" -e "WEBPUBLIC=public/es" -p 8888:80 alfonso/nginx-phalcon

Will mount your folder /pathto/to/your/code  as /var/www and the document root will be /var/www/public/es
### Port
Change -p 8888:80
Where 80 is the port exposed by the container and 8888 your choice port.