apt-get update
apt-get install -y nginx
apt-get -y install php-cli php-mysql php-curl php-gd php-intl

tar -xzvf var/www/wordpress.tar.gz

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

service nginx start