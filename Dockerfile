FROM ubuntu 

RUN apt-get update && apt-get install -y apache2 apache2-utils
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y libpq-dev
RUN apt-get clean

RUN pip3 install sqlalchemy
RUN pip3 install psycopg2

RUN a2dismod mpm_event
RUN a2enmod mpm_prefork cgi

COPY ./script.py /var/www/test/index.py
COPY ./conf/apache.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]