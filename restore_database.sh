#!/bin/bash
#
# Restore a database from a .sql file
# (an SQL dump)

function usage {
    echo ""
    echo "restore_database.sh script:"
    echo "Restores a database from an SQL dump."
    echo ""
    echo "       ./restore_database.sh <sql-dump-file>"
    echo ""
    echo "Example:"
    echo ""
    echo "       ./restore_database.sh wikidb_dump.sql"
    echo ""
    echo ""
}

if [[ "$#" -ne 1 ]];
then
    docker exec stormy_mysql sh -c 'exec mysql -uroot -p"`cat $MYSQL_ROOT_PASSWORD_FILE`"' < $1
else
    usage
fi

