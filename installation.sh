#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo "You are running with root access"
else
    echo "Error: you are not running with root access"
    exit 1
fi

dnf list installed mysql

if [$? -ne 0 ]
then
    echo "MySQL is not installed...initialising Installation"
    dnf install mysql -y

    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is. . . Success"
    else
        echo "Installing MySQL is. . . FAILURE"
    exit 1
    fi
else
    echo "MySQL is already installed."
fi