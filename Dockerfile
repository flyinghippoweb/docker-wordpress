FROM wordpress

RUN sed -i -e 's/:33:33:/:1000:1000:/' /etc/passwd
RUN sed -i -e 's/www-data:x:33:/www-data:x:1000:/' /etc/group

#CMD ["apache2-foreground"]
