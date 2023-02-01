# echo "environnement :" $DATABASE_NAME $DATABASE_USER $DATABASE_PASSWORD
# if ! [ -d "/var/lib/mysql/wordpress" ]; then
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;"
mysql -e "CREATE USER IF NOT EXISTS \`$DATABASE_USER\`@'%' IDENTIFIED BY \`$DATABASE_PASSWORD\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`$DATABASE_NAME\`.* TO \`$DATABASE_USER\`@'%' IDENTIFIED BY \`$DATABASE_PASSWORD\`;"
mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
	# service mysql stop
# fi
exec mysqld_safe