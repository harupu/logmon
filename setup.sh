#!/bin/sh -x

mkdir -p /etc/logmon

pushd $(dirname $0)
cp ./logmon.pl /etc/logmon/
cp ./logmon.conf /etc/logmon/
if [ -e "/etc/ec2_version" ]; then
  cp ./supervisor_logmon.conf /etc/supervisor/conf.d/logmon.conf
fi
popd

chmod 700 /etc/logmon/logmon.pl
chmod 600 /etc/logmon/logmon.conf

if [ -e "/etc/ec2_version" ]; then
  chmod 600 /etc/supervisor/conf.d/logmon.conf
fi

if [ -e "/etc/ec2_version" ]; then
  service supervisor start
  supervisorctl reread
  supervisorctl start logmon
fi
