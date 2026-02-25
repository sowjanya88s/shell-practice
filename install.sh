#!/bin/bash

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id != 0 ]
then
echo " pls run this with root user privileges"
dnf install mysql -y
if [ $? != 0 ];
then
echo "mysql installation ... success"
exit 1
else
echo "mysql installation ... failed"
fi