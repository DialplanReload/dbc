#!/bin/bash
#
# Debian basic config
#
# Basic configurations for Debian
#

# Adjust sources list
wget -c http://dialplanreload.com/downloads/sources-list && 
mv /etc/apt/sources.list /etc/apt/sources.list-old &&
mv sources-list /etc/apt/sources.list

# Update repository
apt-get update

# Installing basic packages

apt-get install -y  htop mtr vim tcpdump sed git curl 

# Adjust VIM configs
sed -i 's/^\"syntax on/syntax on/' /etc/vim/vimrc
echo "color ron" >> /etc/vim/vimrc

# Change SSH port to 2522 
echo "========================================="

echo "Do you need change ssh port to 2522? [y/n]"

echo "========================================="

read sshport

if [ "$sshport"  == "y" ] ; then 

sed -i 's/^Port 22/Port 2522/' /etc/ssh/sshd_config

echo "Changing"

else

echo "Not Changed..."

fi

echo "========================================="

echo "Restarting SSH Service"

echo "========================================="

/etc/init.d/ssh restart 

mkdir /root/.ssh 
> /root/.ssh/authorized_keys
wget -c http://dialplanreload.com/downloads/chave.asc.pub
cat chave.asc.pub >> /root/.ssh/authorized_keys
rm chave.asc.pub

echo "nameserver	8.8.8.8" > /etc/resolv.conf

echo "========================================="

echo "Finalizado"

echo "========================================="

