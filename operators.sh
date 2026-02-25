#!/bin/bash

number=$1
if [ $number -gt 25 ];
then
echo "given number: $number is greater than 25"
elif [ $number -lt 25 ];
echo "given number: $number is less than 25"
else
echo "given number: $number is equal to 25"
fi