#!/bin/bash

echo "all variables passed to the script: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "user running this script: $USER"
echo "home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"