#!/bin/bash
# runs as root inside a clean container: create a normal user with sudo (like a real server), then hand over
export DEBIAN_FRONTEND=noninteractive
echo "### os: $(. /etc/os-release; echo "$PRETTY_NAME") / $(uname -m)"
apt-get update -qq
# the minimum a user has before they can clone the repo
apt-get install -y -qq sudo curl git ca-certificates >/dev/null
useradd -m -s /bin/bash joshua
echo 'joshua ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/joshua
cp /out/user-steps.sh /home/joshua/user-steps.sh
chown joshua:joshua /home/joshua/user-steps.sh
su - joshua -c 'TERM=xterm-256color bash ~/user-steps.sh'
echo "### container finished"
