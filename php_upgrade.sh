#!/bin/bash

BASH_PATH='/usr/local/src'

PHP_VERSION=$(cat $BASH_PATH/php_version)

TMP1=${PHP_VERSION: 0:4}

TMP2=`expr ${PHP_VERSION: -1} + 1`

NEW_PHP_VERSION=$TMP1$TMP2

echo $NEW_PHP_VERSION  > $BASH_PATH/php_version

wget https://www.php.net/distributions/php-$NEW_PHP_VERSION.tar.gz  -O $BASH_PATH/php-$NEW_PHP_VERSION.tar.gz

tar xf $BASH_PATH/php-$NEW_PHP_VERSION.tar.gz

cp $BASH_PATH/config.nice $BASH_PATH/php-$NEW_PHP_VERSION/

cd $BASH_PATH/php-$NEW_PHP_VERSION  && ./config.nice && make && make install

rm -rf $BASH_PATH/php-$NEW_PHP_VERSION $BASH_PATH/php-$NEW_PHP_VERSION.tar.gz

systemctl restart php-fpm

exit
