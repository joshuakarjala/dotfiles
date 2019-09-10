#!/bin/sh
mv /etc/localtime /etc/localtime.old
ln -s /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime

adduser --disabled-password --shell /bin/bash --gecos "" joshua
echo "joshua:changeThis" | sudo chpasswd
usermod -aG sudo joshua

mkdir -p /home/joshua/.ssh
curl -s https://github.com/joshuakarjala.keys > /home/joshua/.ssh/authorized_keys
echo "Host github.com\nIdentityFile ~/.ssh/id_joshua" > /home/joshua/.ssh/sshd_config

chown -R joshua:joshua /home/joshua/.ssh

curl -s https://gist.githubusercontent.com/joshuakarjala/1fe7b1e9afd9616b6af170f4dc282849/raw/ce8f60273d219dcc3b2c9a44309262ba907f0900/sshd_config > /etc/ssh/sshd_config

service ssh restart




