touch tmp_file
chmod 777 tmp_file

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> tmp_file
# echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file
echo "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> tmp_file
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$MYSQL_USER'@'%';"  >> tmp_file
# echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"  >> tmp_file
echo "FLUSH PRIVILEGES;" >> tmp_file

mysqld --user=mysql --verbose --bootstrap < tmp_file
rm tmp_file

exec mysqld

