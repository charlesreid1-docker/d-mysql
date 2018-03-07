# d-mysql

[Link to MySQL container on dockerhub](https://hub.docker.com/_/mysql/)

This uses the stock MySQL docker container to run MySQL.

**Port:** 3306

**Service:** MySQL server

MySQL data is stored in `mysql_data/`, bound in the 
container to `/var/lib/mysql`.

MySQL configuration file is in `krash.mysql.cnf`.
(create your alternative configuration file in a directory on the host machine and then mount that directory location as /etc/mysql/conf.d inside the mysql container.)

To load and dump, run another mysql process in the same container.
The container is called `stormy_mysql`.

Dumping:

```
docker exec stormy_mysql \
    sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > all-databases.sql
```

Loading:

```
docker exec stormy_mysql \
    sh -c 'exec mysql -u root -p"$MYSQL_ROOT_PASSWORD"' < wikidb_dump.sql
```


