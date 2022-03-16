#!/bin/bash
#Check mysql php nginx must be working.
#BY:0x1818   date:2017/12/12 Version:1.0 beta

if [ ! -x /usr/bin/nmap ];then

yum install nmap -y

fi

if [ ! -x /usr/bin/crontab ];then

yum install cronie -y
systemctl restart crond

fi
mysql_value=$(/usr/bin/nmap -sT 127.0.0.1 |grep 3306 |awk '{print $2}')

nginx_value=$(/usr/bin/nmap -sT 127.0.0.1 |grep 80 |awk '{print $2}')

php_value=$(/usr/bin/nmap -sT 127.0.0.1 |grep 9000 |awk '{print $2}')

if [ "$mysql_value" != "open" ];then

         service mysql start
fi


if [ "$nginx_value" != "open" ];then

         service nginx start
fi

if [ "$php_value" != "open" ];then

         service php-fpm start
fi

exit
