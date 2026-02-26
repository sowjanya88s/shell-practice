#!/bin/bash
LOG_DIR=/var/log/shell-script
LOG_file=/var/log/shell-script/$0.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

user_id=$(id -u)
echo "user id is: $user_id"

if [ $user_id -ne 0 ]; then
echo " $R pls run this with root user privileges $N" | tee -a $LOG_file
exit 1
fi

mkdir -p $LOG_DIR

validate() {
    if [ $1 -eq 0 ] ; then
    echo " $2 ... $G success $N" | tee -a $LOG_file
else 
    echo " $2 ... $R failure $N" | tee -a $LOG_file
    exit 1
    fi
}

for package in $@
do
    yum list installed | grep $package &>> $LOG_file
    if [ $? -ne 1 ] ; then
    echo "  $package is already installed ... $Y skipping $N " 
    else
    yum install $package -y &>> $LOG_file
    validate "$?" "installation of $package"
    fi
done


