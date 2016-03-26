#!/bin/sh

apt-get update
apt-get -y install python-setuptools python-m2crypto supervisor python-pip
pip install shadowsocks

which supervisord
which ssserver

cp shadowsocks_1.json /etc/
cp shadowsocks.conf /etc/supervisor/conf.d/

service supervisor start

sed -i 's|^\s*exit|#exit|' /etc/rc.local
echo "" >> /etc/rc.local
echo "service supervisor start;" >> /etc/rc.local
echo "exit 0;" >> /etc/rc.local


