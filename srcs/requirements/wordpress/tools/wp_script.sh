#! /bin/bash

mkdir -p /var/www/html/mywebsite
cd /var/www/html/mywebsite
chown -R www-data:www-data /var/www/html/mywebsite/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 2

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


# Download WordPress if not already present
if [ ! -f "wp-config.php" ]; then
    wp core download --path=/var/www/html/mywebsite/ --allow-root
    cp wp-config-sample.php wp-config.php
fi;



sed -i "s/^define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$db');/" wp-config.php
sed -i "s/^define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$db_user');/" wp-config.php
sed -i "s/^define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$db_password');/" wp-config.php
sed -i "s/^define( 'DB_HOST', 'localhost' )/define( 'DB_HOST', '$hostname');/" wp-config.php

mkdir /run/php


if ! wp --allow-root core is-installed --path=/var/www/html/mywebsite/
then
    wp core install --path=/var/www/html/mywebsite/ --url=https://$WP_DOMAIN --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root
fi;


if ! wp --allow-root --path=/var/www/html/mywebsite/ user get $second_user;
then
    wp user create $second_user $second_user_mail --role=author --user_pass=$second_user_pass --display_name=$second_user_display_name --allow-root
fi;

wp user update $second_user --admin_color=sunrise --allow-root




php-fpm7.4 -F

