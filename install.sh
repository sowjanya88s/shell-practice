#!/bin/bash

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " pls run this with root user privileges"
exit 1
fi

sudo dnf install nginx -y
if [ $? -ne 1 ]; then
echo "nginx installation ... success"
exit 1
else
echo "nginx installation ... failed"
fi

sudo dnf install mysql -y
if [ $? -ne 1 ]; then
echo "mysql installation ... success"
exit 1
else
echo "mysql installation ... failed"
fi

sudo dnf install vsftpd -y
if [ $? -ne 1 ]; then
echo " vsftpd installation ... success"
exit 1
else
echo "vsftpd installation ... failed"
fi