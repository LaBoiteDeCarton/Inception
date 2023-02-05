# starting mysql
service mysql start;
# creation database and users if not already exists
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DATABASE_USER}\`@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO \`${DATABASE_USER}\`@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
# restart mysql
mysqladmin -u root -p$DATABASE_ROOT_PASSWORD shutdown
# starting mysql on daemon
exec mysqld_safe

