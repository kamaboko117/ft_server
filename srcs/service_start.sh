apt-get update
apt-get install nginx -y

service nginx start
apt-get install openssl
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/localhost.pem \
	-keyout /etc/nginx/ssl/localhost.key \
	-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=kama/CN=localhost"

apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli \
	php7.3-common php7.3-json php7.3-opcache php7.3-readline
service php7.3-fpm start
mkdir /var/www/localhost

sleep infinity
#apt-get install mariadb-server

#apt-get install php-fpm php-mysql -y

# service nginx start && tail -f /dev/null