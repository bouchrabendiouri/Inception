FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl && mkdir /var/www/html/mywebsite \
	&& chmod 755 /var/www/html/mywebsite \
	&& chown -R www-data:www-data /var/www/html/mywebsite


COPY ./conf/wp.conf /etc/nginx/sites-available/


COPY ./tools/ngx_script.sh /
RUN chmod +x ngx_script.sh

EXPOSE 443


CMD ["bash", "./ngx_script.sh"]
