#!/bin/bash

set -e #exit when error came

trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR #setting trap with ERR signal

echo "Hello World"
echo "I am learning Shell"
echoo "printing error here" #echoo spelling error
echo "No error in this"
