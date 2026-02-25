#!/bin/bash

echo "args passed: $@"
echo "no.of arguments passed: $#"
echo "current username is: $USER"
echo "present working directory is: $PWD"
echo "home directory of current user is: $HOME"
echo "script name is: $0"
echo "process id: $$"
sleep 10 &
echo "process id of background process is: $!"
echo "exit status of last command is: $?"
