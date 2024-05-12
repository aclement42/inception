#!/bin/bash
set -x

service mariadb start
sleep 10
service mariadb status

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

#mariadb est la version libre de droit de mysql
#exec mysqld_safe: lance de fzcon securise mysql