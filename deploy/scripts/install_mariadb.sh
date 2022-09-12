#!/bin/bash

#Add Repo and update yum
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash -s -- --mariadb-server-version=mariadb-10.8
yum update -y

yum install mariadb-server mariadb galera-4 -y