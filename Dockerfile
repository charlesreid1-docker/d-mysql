FROM mysql:5.7.21
MAINTAINER charles@charlesreid1.com

# make mysql data a volume
VOLUME ["/var/lib/mysql"]

# put password in a password file
RUN printf "[client]\nuser: root\npassword: $MYSQL_ROOT_PASSWORD" > /etc/mysql/conf.d/rootpw.cnf
RUN chmod 0600 /etc/mysql/conf.d/rootpw.cnf

RUN chown mysql:mysql /var/lib/mysql
