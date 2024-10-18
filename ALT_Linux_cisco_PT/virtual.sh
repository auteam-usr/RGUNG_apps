#!/bin/bash
apt-get install kernel-headers-modules-std-def -y
apt-get install make -y
apt-get remove virtualbox-* -y
rm -rf /home/user/VirtualBox-*
wget https://download.virtualbox.org/virtualbox/5.1.18/VirtualBox-5.1.18-114002-Linux_amd64.run
mv VirtualBox-5.1.18-114002-Linux_amd64.run /home/user
cd /home/user
chmod +x VirtualBox-5.1.18-114002-Linux_amd64.run
cd /home/user
./VirtualBox-5.1.18-114002-Linux_amd64.run

