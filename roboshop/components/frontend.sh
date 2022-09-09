#!/bin/bash
set -e   # ensure your script will stop if any of the instruction fails

source components/common.sh

echo "Installing Nginx: "
yum install nginx -y   >> /tmp/frontend.log 
if [ $? -eq 0 ] ; then 
    echo -e "\e[32m Success \e["
fi 


systemctl enable nginx 

echo "Starting Nginx: "
systemctl start nginx 
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip -o /tmp/frontend.zip >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx

# source is a command to import a file and run it locally