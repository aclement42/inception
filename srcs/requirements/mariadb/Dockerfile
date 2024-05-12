FROM debian:bullseye

#MISE A JOUR DE MA VERSION DEBIAN
RUN apt-get update
RUN apt-get upgrade -y
#installation mariadb
RUN apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/scrypt.sh ./scrypt.sh

#rendre le scrypt executable
RUN chmod +x ./scrypt.sh
RUN chown root:root ./scrypt.sh

#creation de sous doss pour mysql: stock db dans var/lib/mysql && ecriture socket run/mysqld
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld

#change l'utilisateur et le grp qui ont les droits sur var/lib/mysql && run/mysqld
RUN chown mysql:mysql /var/lib/mysql
RUN chown mysql:mysql /run/mysqld
RUN chmod 777 /var/lib/mysql
RUN chmod 777 /run/mysqld

USER 0:0
CMD [ "bash", "./scrypt.sh" ]