#!/bin/bash

db=$1

SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`

pass=`cat $SCRIPTPATH/pass`
user=`cat $SCRIPTPATH/user`
echosalt=$SCRIPTPATH/echo-salt.sh
createdb=$SCRIPTPATH/create-db.sh

if [ -z "$db" ]
then
    echo "Usage:"
    echo ""
    echo "./unpack-wp.sh databbase-name"
    echo 
    exit 1
fi

if [ -z "$user" ]
then
    echo "echo 'mysql-username' >> user "
    echo ""
    exit 1
fi

if [ -z "$pass" ]
then
    echo "echo 'mysql-password' >> pass "
    echo ""
    exit 1
fi

if [ -e "wordpress" ]
then
    echo "Directory wordpress all ready exists."
    echo "Not going to over-ride it."
    echo 
    exit 1
fi

if [ -e "/var/www/html/$db" ]
then
    echo "Website all ready exists."
    echo "Not going to over-ride it."
    echo 
    exit 1
fi


$createdb $db

tar -xzvf latest.tar.gz  
cd wordpress 
sed s/database_name_here/$db/ wp-config-sample.php \
| sed s/username_here/$user/  \
| sed s/password_here/$pass/  \
> wp-config.php
$echosalt >> wp-config.php

cd ..
sudo mv wordpress /var/www/html/$db

echo SUCCESSFULLY CREATED $db
echo 
echo test it by doing:
echo 
echo lynx localhost/$db
