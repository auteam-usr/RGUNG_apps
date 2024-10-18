#!/bin/bash
sudo echo "user ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo chmod +x rc.local
sudo chmod +x virtual.sh
sudo chmod +x packetns.sh
sudo apt-get install -y \
	putty \
	eclipse \
	binutils \
	firefox \
	gns3 \
	linphone \
	wireshark \
	libvirt \
	libvirt-kvm \
	virt-manager

# Find Cisco Packet Tracer installer
installer_name_1=CiscoPacketTracer*Ubuntu_64bit.deb
installer_name_2=Cisco_Packet_Tracer_*_Ubuntu_64bit_*.deb
installer_name_3=Cisco*.deb
path_to_pt=$(find /home -name $installer_name_1 -o -name $installer_name_2 -o -name $installer_name_3)

if [[ -z "$path_to_pt" ]]; then
    echo "Packet Tracer installer not found in /home. It must be named like this: $installer_name."
    echo "You can download the installer from www.netacad.com/portal/node/488."
    exit 1
fi

if [ -e /opt/pt ]; then
  echo "Removing old version of Packet Tracer from /opt/pt"
  sudo rm -rf /opt/pt
  sudo rm -rf /usr/share/applications/cisco-pt.desktop
  sudo rm -rf /usr/share/applications/cisco-ptsa.desktop
  sudo rm -rf /usr/share/applications/cisco7-pt.desktop
  sudo rm -rf /usr/share/applications/cisco7-ptsa.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-pt.desktop
  sudo xdg-desktop-menu uninstall /usr/share/applications/cisco-ptsa.desktop
  sudo update-mime-database /usr/share/mime
  sudo gtk-update-icon-cache --force /usr/share/icons/gnome

  sudo rm -f /usr/local/bin/packettracer
fi

echo "Extracting files"
mkdir packettracer
ar -x $path_to_pt --output=packettracer
tar -xvf packettracer/control.tar.xz --directory=packettracer
tar -xvf packettracer/data.tar.xz --directory=packettracer

sudo cp -r packettracer/usr /
sudo cp -r packettracer/opt /
sudo sed -i 's/packettracer/packettracer --no-sandbox args/' /usr/share/applications/cisco-pt.desktop
sudo ./packettracer/postinst

echo "Installing dependencies"
sudo apt-get install -y \
  qt5-multimedia-common \
  qt5-webengine-common \
  qt5-networkauth-common \
  qt5-websockets-common \
  qt5-webchannel-common \
  qt5-script-common \
  qt5-location-common \
  qt5-svg-common \
  qt5-speech-common

sudo rm -rf packettracer
echo "Start Services"
systemctl enable libvirtd
systemctl start libvirtd
echo "GNS3 Import Configs"
cp gns3_controller.conf /home/user/.config/GNS3/2.2/
cp vIOS-L2.vmdk /home/user/GNS3/images/QEMU/vIOS-L2.vmdk
echo "Import Scripts"
cp cisco-pt.desktop /usr/share/applications/
cp rc.local /etc/rc.d
mkdir /opt/scripts
cp packetns.sh /opt/scripts
echo "Install VBox"
./virtual.sh
rm -f /home/user/.config/GNS3/2.2/gns3_server.conf
cd /home/user/simplyfix
cp gns3_server.conf /home/user/.config/GNS3/2.2/gns3_server.conf
