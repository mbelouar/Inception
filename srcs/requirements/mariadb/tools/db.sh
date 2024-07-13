#!/bin/bash

sed -i 's/${DB_USER}/'"$DB_USER"'/g' db.sql
sed -i 's/${DB_PASS}/'"$DB_PASS"'/g' db.sql

service mariadb start
mysql < /db.sql