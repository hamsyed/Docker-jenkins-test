FROM amazonlinux:latest
MAINTAINER Syed Hameed 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/index.html/
WORKDIR /var/www/index.html
RUN yum install unzip httpd -y
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic.zip photogenic
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
