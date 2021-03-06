#!/bin/bash

sed -i s/"set time_zone='00:00'"/"set time_zone='Asia/Tokyo'"/g /u01/app/oracle/product/11.2.0/xe/bin/createdb.sh

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export PATH=$PATH:/u01/app/oracle/product/11.2.0/xe/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

cd $ORACLE_HOME

sqlplus sys/oracle as sysdba <<EOF
shutdown immediate
startup restrict mount
drop database;
quit
EOF

/u01/app/oracle/product/11.2.0/xe/bin/createdb.sh -dbchar JA16SJISTILDE
