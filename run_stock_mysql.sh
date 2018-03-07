#!/bin/bash
#
# Run mysql 5.7 via docker
#
# Data is stored in mysql_data/
# 
# Set the root password by changing 
# contents of root.password

MYSQL_DATA_DIR="mysql_data"
MYSQL_CONFIG="krash.mysql.cnf"
PW_FILE="root.password"

docker pull mysql:5.7.21

docker container prune -f

mkdir -p ${PWD}/${MYSQL_DATA_DIR}

docker run \
    --name stormy_mysql \
    -v ${PWD}/${MYSQL_DATA_DIR}:/var/lib/mysql \
    -v ${PWD}/${PW_FILE}:/root.password \
    -v ${PWD}/${MYSQL_CONFIG}:/etc/mysql/conf.d/${MYSQL_CONFIG} \
    -e MYSQL_ROOT_PASSWORD_FILE=/root.password \
    -d \
    mysql:5.7.21

