FROM ubuntu:20.10

RUN apt-get update -y && apt-get upgrade -y && apt-get install openssl curl gnupg2 -y
RUN curl -o nginx_signing.key https://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ focal nginx \ndeb-src http://nginx.org/packages/mainline/ubuntu/ focal nginx" >> /etc/apt/sources.list.d/nginx.list
RUN apt-get update -y && apt-get install nginx -y

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
