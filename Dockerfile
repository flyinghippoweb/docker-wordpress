FROM wordpress

RUN sed -i -e 's/:33:33:/:1000:1000:/' /etc/passwd
RUN sed -i -e 's/www-data:x:33:/www-data:x:1000:/' /etc/group

RUN apt-get update && apt-get update
RUN apt-get install -y php5-mysql
RUN apt-get install -y php5-gd
RUN apt-get install -y php5-curl
RUN yes | apt-get install -y php-soap

#CMD ["apache2-foreground"]
