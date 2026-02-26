#!/bin/bash

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " pls run this with root user privileges"
exit 1
fi

validate() {
    if [ $1 -eq 0 ] ; then
    echo "$2 ... success"
else 
    echo "$2 ... failure"
    exit 1
    fi
}

sudo dnf install nginx -y
validate "$?" "installing nginx"

sudo dnf install git -y
validate "$?" "installing mysql"

sudo dnf install vsftpd -y
validate "$?" "installing vsftpd"