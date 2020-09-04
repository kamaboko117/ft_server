FROM debian:buster

COPY srcs/service_start.sh .
COPY srcs/wordpress.tar.gz var/www/
COPY srcs/localhost /etc/nginx/sites-available/

RUN bash service_start.sh