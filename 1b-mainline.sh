#!/bin/bash

#Mainline installer
sudo add-apt-repository ppa:cappelikan/ppa -y
sudo apt update
sudo apt install mainline -y
echo
echo RAVECONSOLE -- Mainline Kernel has been installed
echo
sudo dpkg -i libssl3_3.0.0-1_amd64.deb
echo RAVECONSOLE -- libssl3 has been installed
echo
echo
echo RAVECONSOLE -- Mainline script finished!
