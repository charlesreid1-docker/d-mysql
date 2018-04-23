# d-mysql

This is the MySQL docker container used to run MySQL on charlesreid1.com.

You should not run this container by itself (see 
[pod-charlesreid1](https://git.charlesreid1.com/docker/pod-charlesreid1.git)), 
but if you do, use the `Makefile`.

## Base Image

This repo contains a Dockerfile and a docker-compose file 
for running a slightly modified stock MySQL container.

[Link to stock MySQL container on dockerhub](https://hub.docker.com/_/mysql/)

## docker-compose

Use docker-compose and pod-charlesreid1 for an example of 
running a mysql docker container using docker-compose.

The pod uses an environment variable to pass in the root password 
to the container, so the process is automated.

See `docker-compose.fixme.yml` in 
[pod-charlesreid1](https://git.charlesreid1.com/docker/pod-charlesreid1.git).

This repo uses plain `docker` commands.

## makefile

TLDR: build and run the container with:

```
make
```

There are a few make tasks:

* `make build` task - build the MediaWiki docker container
* `make run` task - run the MW docker container
* `make disk` - make a docker volume for the MW container
* `make rm_disk` - remove the docker volume for the MW container
* `make clean` - stop the currently running mysql container
* `make cleanreally` - stop the container and dele the data volume

Some cleanup commands:

```
make clean       # stop running container
make cleanreally # CAREFUL!!! deletes the data volume 
make rm_disk     # CAREFUL!!! deletes the data volume
```

Some startup commands:

```
make disk   # make the disk
make build  # re-build container
make run    # run container
```

## mysql service info

**Port:** 3306

**Service:** MySQL server

MySQL data is stored in `mysql_data/`, bound in the 
container to `/var/lib/mysql`.

MySQL configuration file is in `krash.mysql.cnf`.
(create your alternative configuration file in a directory on the host machine and then mount that directory location as /etc/mysql/conf.d inside the mysql container.)

To load and dump, run another mysql process in the same container.
The container is called `stormy_mysql`.


## creating/restoring backups

See the directory [`utils-mysql/`](https://git.charlesreid1.com/docker/pod-charlesreid1/src/branch/master/utils-mysql)
in the [pod-charlesreid1](https://git.charlesreid1.com/docker/pod-charlesreid1)
repo.

(Basically, these create a shell inside the container,
and run commands to dump the database and copy the data
out, or copy the data in and restore the database.)

## phpMyAdmin

While MySQL is a useful tool, the command line interface
and SQL syntax is annoying and clunky.

To fix that, use phpMyAdmin - or better yet, use it in 
a docker container. See [d-phpmyadmin](https://git.charlesreid1.com/docker/d-phpmyadmin)
repo for details.


