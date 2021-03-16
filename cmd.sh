#!/bin/bash
set -e

chown -R mysql:mysql /var/lib/mysql
#service mysql start
mysql < /test.sql 
mysqld && bash 
