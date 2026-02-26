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

for package in $@
do
    yum list installed | grep $package
    if [ $? -ne 1 ] ; then
    echo " $package is already installed"
    validate "$?" "installation of $package"
    else
    yum install $package -y
    fi
done