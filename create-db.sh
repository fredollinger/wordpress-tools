#!/bin/bash

SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`
pass=`cat $SCRIPTPATH/pass`
user=`cat $SCRIPTPATH/user`

mysql="sudo mysql --password=$pass -e"
db=$1

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

if [ -z "$db" ]
then
    echo "Usage:"
    echo ""
    echo "./create-db.sh databbase-name"
    echo 
    exit 1
fi

$mysql "CREATE DATABASE $db";
$mysql "GRANT ALL PRIVILEGES ON $db.* TO $user@localhost;";
$mysql "FLUSH PRIVILEGES;"
