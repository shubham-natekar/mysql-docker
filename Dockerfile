FROM ubuntu:20.04
MAINTAINER Shubham Natekar <shubhamnatekar9221@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq &&  apt-get install mysql-server mysql-client -y

COPY ./test.sql /

COPY ./cmd.sh /usr/local/bin/cmd.sh

RUN chmod +x /usr/local/bin/cmd.sh

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/usr/local/bin/cmd.sh"]

#CMD mysql < /test.sql  

#FROM mysql
#MAINTAINER Shubham Natekar <shubhamnatekar9221@gmail.com>
#COPY ./test.sql /docker-entrypoint-initdb.d/
#CMD service mysql stop
#usermod -d /var/lib/mysql/ mysql
