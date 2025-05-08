FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install -y php7.4 php7.4-fpm php-mysql wget mariadb-client php-curl curl

COPY ./tools/wp_script.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod +x /wp_script.sh


CMD ["bash", "wp_script.sh"]
