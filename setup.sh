#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Usage: sudo $0" 1>&2
  exit 1
fi

mkdir -p /usr/local/logmon/bin \
&& mkdir -p /usr/local/logmon/etc \
&& mkdir -p /usr/local/logmon/etc \
&& cp ./logmon.pl /usr/local/logmon/bin/ \
&& cp ./logmon.conf /usr/local/logmon/etc/ \
&& chmod 700 /usr/local/logmon/bin/logmon.pl \
&& chmod 600 /usr/local/logmon/etc/logmon.conf \
&& cp ./logmon.service /etc/systemd/system/logmon.service \
&& systemctl daemon-reload \
&& systemctl start logmon.service \
&& systemctl enable logmon.service

exit 0
