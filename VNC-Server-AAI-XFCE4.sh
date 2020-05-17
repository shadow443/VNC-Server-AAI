#!/bin/sh
# VNC Server Installation Script for Ubuntu 14.04, and every version up, including 18.04.
# Xfce4 Desktop Environment
# Run with sudo ./
# You may need to chmod +x the file
# Commands meant for current user will be run as current user NOT sudo
#
# Please Change VNCUSER Variable to Current User Before Running!
# You will have to enter a password for VNC right after the the packages are installed
#
# This is the second version of this script, see CHANGELOG for all of the changes I have made.
 
 
#VNCUSER="change_to_current_user_before_running"
VNCUSER=testvnc
sudo adduser testvnc && sudo usermod -aG sudo testvnc && su --login testvnc
sudo ls

#----------DO NOT EDIT BELOW THIS LINE---------------
 
apt-get -y update

echo "Starting VNC Installation"

apt-get -y install xfce4 xfce4-goodies tightvncserver xfonts-100dpi xfonts-100dpi-transcoded xfonts-75dpi \
xfonts-75dpi-transcoded xfonts-base autocutsel chromium-browser git -y

git clone https://github.com/shadow443/VNC-Server-AAI.git && cd VNC-Server-AAI

echo "Packages installed, starting VNC configurations"
sudo -u $VNCUSER vncserver
sudo -u $VNCUSER vncserver -kill :1
sudo -u $VNCUSER mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
sudo -u $VNCUSER mv configs/xfce4_configs ~/.vnc/xstartup
sudo -u $VNCUSER chmod +x ~/.vnc/xstartup
sudo -u $VNCUSER vncserver
sudo -u $VNCUSER vncserver -kill :1

echo "VNC Server Successfully Installed!"
echo "Start VNC Server with the following command"

echo " "
echo "       vncserver      "
echo " "

echo " "

echo "Download makemkv"
wget "https://www.makemkv.com/download/makemkv-bin-1.15.1.tar.gz"
tar xf makemkv-bin-1.15.1.tar.gz
cp makemkv-bin-1.15.1\bin\amd64\makemkvcon .


echo "All Credit goes to Leslie Suhm!"

echo "Check us out at Github!"

echo "https://github.com/lesliesuhm/VNC-Server-AAI"
