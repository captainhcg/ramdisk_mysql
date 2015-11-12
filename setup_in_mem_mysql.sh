#!/bin/sh

clear

echo "Create the ramdisk"
diskutil erasevolume HFS+ "mysql_test" `hdiutil attach -nomount ram://1165430`
cp mysql_test.cnf /Volumes/mysql_test/my.cnf

echo "Install new DB"
/usr/local/mysql/scripts/mysql_install_db \
    --defaults-file=/Volumes/mysql_test/my.cnf \
    --user=mysql \
    --basedir=/usr/local/mysql

echo "Start MySQL at background"
/usr/local/mysql/bin/mysqld_safe \
    --defaults-file=/Volumes/mysql_test/my.cnf \
    --user=mysql_test \
    --basedir=/usr/local/mysql \
    &

echo "Test connection"
/usr/local/mysql/bin/mysql \
    -u mysql_test \
    -e "SHOW DATABASES;"

