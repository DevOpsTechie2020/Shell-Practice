#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo -e "$R Script started executing at: $(date) $N" | tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo -e "$R Error:Please run this script with root access $N"
    exit 1
else 
    echo -e "$G You are running with root access $N"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is $G success. $N"
    else
        echo -e "Installing $2 is $R failure. $N"
        exit
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
    echo -e "$R python is not installed...initialising installation $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python is already installed. $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$R Nginx is not installed...initialising installation $N"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx is already installed. $N"
fi