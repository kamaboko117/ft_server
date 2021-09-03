FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install wget -y
RUN apt-get install openssl
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y

COPY srcs/service_start.sh .
COPY srcs/test.php .
COPY srcs/default .
COPY srcs/config.inc.php .
COPY srcs/wp-config.php .

CMD bash service_start.sh