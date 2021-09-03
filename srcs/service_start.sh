mkdir /var/www/localhost
mkdir /var/www/localhost/wordpress
mkdir /etc/nginx/ssl
mv default /etc/nginx/sites-available/
mv test.php /var/www/localhost
mv ./wp-config.php /var/www/localhost/wordpress

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/localhost.pem \
	-keyout /etc/nginx/ssl/localhost.key \
	-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=kama/CN=localhost"

wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-5.1.1-all-languages.tar.gz
mv phpMyAdmin-5.1.1-all-languages /var/www/localhost/phpMyAdmin
mv config.inc.php /var/www/localhost/phpMyAdmin/

service mysql start
echo "GRANT ALL ON *.* TO 'kama'@'localhost' IDENTIFIED BY '123'" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root

echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root

wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
cp -a wordpress/. /var/www/localhost/wordpress

service mysql restart
service php7.3-fpm start
service nginx start

sleep infinity
#apt-get install mariadb-server

#apt-get install php-fpm php-mysql -y

# service nginx start && tail -f /dev/null