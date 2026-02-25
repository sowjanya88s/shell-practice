#!/bin/bash

number=$1
if [ $1 -gt 25 ];
then
echo "given number $1 is greater than 25"
elif [ $1 -lt 25];
echo "given number $1 is less than 25"
else
echo "given number $1 is equal to 25"
fi