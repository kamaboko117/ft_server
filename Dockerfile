FROM debian:buster

COPY srcs/service_start.sh .

RUN bash service_start.sh