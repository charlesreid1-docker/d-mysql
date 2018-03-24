#!/bin/bash
#
# Run mysql 5.7 via docker
#
# Data is stored in mysql_data/
# 
# Set the root password by changing 
# contents of root.password

MYSQL_CONFIG="krash.mysql.cnf"

docker container prune -f

docker run \
    --name stormy_mysql \
    -v stormy_mysql_data:/var/lib/mysql \
    -v ${PWD}/${MYSQL_CONFIG}:/etc/mysql/conf.d/${MYSQL_CONFIG} \
    -e MYSQL_ROOT_PASSWORD="`cat ../root.password`" \
    -d \
    super_mysql

