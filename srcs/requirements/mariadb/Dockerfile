
FROM	debian:bullseye

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install mariadb-server -y

RUN     mkdir -p /run/mysqld && chown mysql:root /run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/mariadb.sh /etc/mariadb.sh

RUN		chmod +x /etc/mariadb.sh

EXPOSE	3306

CMD		["sh", "/etc/mariadb.sh"]