lnmp.sh 只安装nginx最新稳定版、mariadb-10.2.x最新稳定版、PHP可指定版本默认php-7.2.0，可以自定义网址，不需要带www，比如：mrlile.com，默认支持mysql远程连接，为了安全并没有在防火墙开放远程连接3306端口，默认开启22和80端口。

lnmp_check.sh 脚本来自动检测php-fpm、mysql、nginx进程是否正常，设置15秒检测一次，如果进程出现问题则：自动重启进程。


