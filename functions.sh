#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Error: please run this script with root access"
    exit1
else
    echo "You are running with root access"
fi     
VALIDATE(){
   if [ $1 -eq 0 ]
    then
        echo "Installing $2 is SUCCESS."
    else
        echo "Installing $2 is FAILURE."
        exit 1
    fi  
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed...initialising installation"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed."
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...initialising installation"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed."
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not installed...initialising installation"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed."
fi