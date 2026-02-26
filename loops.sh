#!/bin/bash
LOG_DIR=/var/log/shell-script
LOG_file=/var/log/shell-script/$0.log
user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " pls run this with root user privileges" | tee -a $LOG_file
exit 1
fi

mkdir -p $LOG_DIR

validate() {
    if [ $1 -eq 0 ] ; then
    echo "$2 ... success" | tee -a $LOG_file
else 
    echo "$2 ... failure" | tee -a $LOG_file
    exit 1
    fi
}

for package in $@
do
    yum list installed | grep $package &>> $LOG_file
    if [ $? -ne 1 ] ; then
    echo " $package is already installed" 
    else
    yum install $package -y &>> $LOG_file
    validate "$?" "installation of $package"
    fi
done