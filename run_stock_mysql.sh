#!/bin/bash
#
# Run mysql 5.7 via docker
#
# Data is stored in mysql_data/
# 
# Set the root password by changing 
# contents of root.password

MYSQL_CONFIG="krash.mysql.cnf"

docker pull mysql:5.7.21

docker container prune -f

mkdir -p ${PWD}/${MYSQL_DATA_DIR}

docker run \
    --name stormy_mysql \
    -v stormy_mysql_data:/var/lib/mysql \
    -v ${PWD}/${MYSQL_CONFIG}:/etc/mysql/conf.d/${MYSQL_CONFIG} \
    -e MYSQL_ROOT_PASSWORD="zeno135" \
    -d \
    mysql:5.7.21

