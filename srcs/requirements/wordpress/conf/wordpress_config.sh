if [ ! -e /var/www/wordpress/wp-config.php ]; then
	wp config create	--allow-root \
		--dbname=$DATABASE_NAME \
		--dbuser=$DATABASE_USER \
		--dbpass=$DATABASE_PASSWORD \
	    --dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install --url=$DOMAIN_NAME --title=$SITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
	wp user create --allow-root --role=author $USER_NAME $USER_MAIL --user_pass=$USER_PASSWORD --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

#daemon
/usr/sbin/php-fpm7.3 -F