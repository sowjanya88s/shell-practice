#!/bin/bash

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " pls run this with root user privileges"
exit 1
fi

sudo dnf install nginx -y
if [ $? -ne 1 ]; then
echo "mysql installation ... success"
exit 1
else
echo "mysql installation ... failed"
fi