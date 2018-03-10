#!/bin/bash
#
# Restore a database from a .sql file
# (an SQL dump)
set -x

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

MYSQL_ROOT_PASSWORD="zeno135"

#if [[ "$#" -eq 1 ]];
#then
#docker exec -i stormy_mysql mysql -uroot -pzeno135 --force wikidb < wikidb_makedb.sql
docker exec -i stormy_mysql mysql -uroot -pzeno135 --force wikidb < wikidb_dump.sql
#else
#    usage
#fi

