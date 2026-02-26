#!/bin/bash

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " pls run this with root user privileges"
exit 1
fi

validate ( $1 -eq 0 ) {
    echo "$2 ... success"
else 
    echo "$2 ... failure"
}

sudo dnf install nginx -y
validate "$?" "installing nginx"

sudo dnf install mysql -y
validate "$?" "installing mysql"

sudo dnf install vsftpd -y
validate "$?" "installing vsftpd"