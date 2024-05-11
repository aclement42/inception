sleep 10
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
    wp config create \
	--allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=$MDB_HOST \
	--path='/var/www/wordpress'

	wp core install \
		--title=$SITE_TITLE \
		--admin_user=$ADMIN \
		--admin_password=$ADMIN_PW \
		--admin_email=$ADMIN_MAIL \
		--skip-email \
		--url=$SITE_ADDRESS \
		--allow-root

	wp user create \
	$USER42 \
	$USER42_MAIL \
	--role=author \
	--user_pass=$USER42_PW \
	--allow-root
fi
cd -
php-fpm7.3 -F