#! bin/bash

openssl req -x509 \
	-nodes \
	-out $SSL_CERT \
	-keyout $SSL_KEY \
	-subj "/CN=$DOMAIN_NAME/C=MA/L=Marrakech" \
	-sha256 -days 356 \
	-newkey rsa:2048

ln -s /etc/nginx/sites-available/wp.conf /etc/nginx/sites-enabled/

service nginx reload

nginx -g "daemon off;"

