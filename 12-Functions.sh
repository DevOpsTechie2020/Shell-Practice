#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]
then
    echo -e "$R Error: please run this script with root access $N"
    exit1
else
    echo -e "$G You are running with root access $N"
fi     
VALIDATE(){
   if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is $G SUCCESS $N."
    else
        echo -e "Installing $2 is $R FAILURE $N."
        exit 1
    fi  
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$R MySQL is not installed...initialising installation $N"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed. $N"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "$R python3 is not installed...initialising installation $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed. $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$R Nginx is not installed...initialising installation $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed. $N"
fi 