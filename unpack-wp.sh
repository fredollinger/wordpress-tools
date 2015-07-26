#!/bin/bash

db=$1

SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`

pass=`cat $SCRIPTPATH/pass`
user=`cat $SCRIPTPATH/user`

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

#tar -xzvf latest.tar.gz 
sed s/database_name_here/$db/ wp-config-sample.php \
| sed s/username_here/$user/  \
| sed s/password_here/$pass/  \
> wp-config.php
