FROM debian:buster

COPY srcs/service_start.sh .

CMD bash service_start.sh