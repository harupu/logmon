#!/bin/sh -x

mkdir -p /etc/logmon

pushd $(dirname $0)
cp ./logmon.pl /etc/logmon/
cp ./logmon.conf /etc/logmon/
cp ./supervisor_logmon.conf /etc/supervisor/conf.d/logmon.conf
popd

chmod 700 /etc/logmon/logmon.pl
chmod 600 /etc/logmon/logmon.conf
chmod 600 /etc/supervisor/conf.d/logmon.conf

service supervisor start
supervisorctl reread
supervisorctl start logmon
