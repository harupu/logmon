#!/bin/sh -x

mkdir -p /etc/logmon

pushd $(dirname $0)
cp ./logmon.pl /etc/logmon/
cp ./logmon.conf /etc/logmon/
cp ./logmon.service /etc/systemd/system/
popd

chmod 700 /etc/logmon/logmon.pl
chmod 600 /etc/logmon/logmon.conf

systemctl daemon-reload
systemctl enable logmon.service
