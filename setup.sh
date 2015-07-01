#!/bin/bash

echo "Setting SYSDBA's password..."

cd /usr/local/firebird/

IBASE_PASSWORD=`grep -Po '(?<=ISC_PASSWD=)[^\s]*' ./SYSDBA.password`

echo "Previous password was ${IBASE_PASSWORD}"

./bin/fbguard -onetime -daemon

sleep 10

./bin/gsec -user sysdba -pass $IBASE_PASSWORD -mo sysdba -pw masterkey
