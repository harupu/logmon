#!/bin/sh -x

mkdir -p /etc/logmon
cp ./logmon.pl /etc/logmon/
cp ./logmon.conf /etc/logmon/
cp ./logmon.service /etc/systemd/system/

chmod 700 /etc/logmon/logmon.pl
chmod 600 /etc/logmon/logmon.conf

systemctl enable logmon.service
