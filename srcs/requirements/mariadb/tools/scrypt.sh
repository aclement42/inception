#!/bin/bash
set -x

service mariadb start
sleep 10
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

#mariadb est la version libre de droit de mysql
#exec mysqld_safe: lance de fzcon securise mysql