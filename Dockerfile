FROM library/debian:10

LABEL MAINTAINER Jordi Toset

WORKDIR /var/www/html

RUN	apt update && \
	apt install -y wget libapache2-mod-php php-mysql php-gd && \
	rm *.html && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -zxvf latest.tar.gz --strip-components=1 && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/stderr /var/log/apache2/error.log && \
	echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
