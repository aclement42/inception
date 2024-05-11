FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install wget -y \
    curl

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wdp.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/auto-config.sh /var/www/wordpress/auto-config.sh
RUN chmod +x /var/www/wordpress/auto-config.sh
ENTRYPOINT ["bash", "/var/www/wordpress/auto-config.sh"]
#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]