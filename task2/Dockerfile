FROM ubuntu:18.04
RUN apt-get update -y \
    && apt-get install nginx -y \
    && apt-get install curl -y
RUN mkdir -p /opt/html
RUN rm -rf /var/www/html/index.nginx-debian.html 
COPY index.html /opt/html
RUN rm -f /etc/nginx/sites-available/*
COPY web /etc/nginx/sites-available/ 
RUN rm -f /etc/nginx/nginx.conf 
COPY  nginx.conf /etc/nginx/
RUN rm -f /etc/nginx/sites-enabled/* 
RUN ln -s /etc/nginx/sites-available/web /etc/nginx/sites-enabled/ 
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]