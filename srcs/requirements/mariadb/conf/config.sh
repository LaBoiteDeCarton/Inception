echo "environnement :" $DATABASE_NAME $DATABASE_USER $DATABASE_PASSWORD
if ! [ -d "/var/lib/mysql/wordpress" ]; then
	service mysql start
	mysql -u root -e "CREATE DATABASE $DATABASE_NAME; CREATE USER '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PASSWORD'; GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%'; FLUSH PRIVILEGES;"
	service mysql stop
fi
mysqld