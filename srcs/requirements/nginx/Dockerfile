
FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y
RUN		apt install -y nginx openssl

RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key -subj \
		"/C=FR/ST=IDF/L=PARIS/0=42/OU=42/CN=aclement.42.fr/UID=aclement"

RUN		mkdir -p /var/run/nginx

COPY	./conf/nginx.conf /etc/nginx/nginx.conf
RUN		mkdir -p /var/www/html && chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

CMD		["nginx", "-g", "daemon off;"]