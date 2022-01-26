#!/bin/bash

# Alap programokat telepito script
# Minden benne van ami LINUX GAMING-hez kell!
# !!!! HA VALAMI INNEN NEM KELL CSAK TEGYEL AZOK A SOROK ELE #-ET !!!!


# Azonnal megnyitja a Nvidia Control Panelt Admin jogokkal
# Ezzel legeneralod a config file-t amihez a kovetkezo sor lesz hozzaadva
sudo nvidia-settings

# Nvidia Control Panel OC Engedelyezes
sudo nvidia-xconfig -a --cool-bits=28

# Faszom se tudja mik ezek, de kellenek
sudo apt install libgconf-2-4 libappindicator1 libc++1 -y

# GreenWithEnvy Nvidia OC Tool
# Ha AMD Kartyad van ezt a reszt szedd ki!
sudo apt install git meson python3-pip python3-setuptools libcairo2-dev libgirepository1.0-dev libglib2.0-dev libdazzle-1.0-dev gir1.2-gtksource-3.0 gir1.2-appindicator3-0.1 python3-gi-cairo appstream-util -y
git clone --recurse-submodules -j4 https://gitlab.com/leinardi/gwe.git
cd gwe
git checkout release
sudo -H pip3 install -r requirements.txt
meson . build --prefix /usr
ninja -v -C build
sudo ninja -v -C build install
cd ..

# Mangohud MSI Afterburner Linux megfeleloje
git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
cd MangoHud
./build.sh build 
./build.sh package 
cd ..

# Felteszi a Steam Telepitojet
sudo apt install steam-installer -y

# Ha Minimal install-t csinaltal akkor FFMPEG kell a bongeszoben video lejatszashoz
sudo apt install ffmpeg -y

# OBS meg ahhoz kello dolgok
sudo apt install v4l2loopback-dkms -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install obs-studio -y

# Epic Games Store Linuxos megfeleloje
sudo apt install gawk libsigsegv2 -y
sudo dpkg -i heroic_1.9.2_amd64.deb

# .DEB csomagok telepitese
# .DEB File-ok legyenek a script mellett ugyanabban a mappaban futtatas elott!
# Ne felejtsd el a scriptben atirni a file neveket futtatas elott
# File nev a sudo dpkg -i parancs utan szunettel elvalasztva legyen!
# Pelda: sudo dpkg -i vivaldi-stable_4.1.2369.18-1_amd64.deb

sudo dpkg -i fajlnev.deb

sudo apt --fix-broken install

# VLC media lejatszo
sudo apt install vlc -y

# Brave Bongeszo Telepitoje
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# WINE Linux Gaming-hez elengedhetetlen telepitoje
# Ha ez felment felugrik majd par ablak azokban nyomj ra az INSTALL Gombra
sudo dpkg --add-architecture i386
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main" -y
sudo apt install --install-recommends winehq-stable winetricks -y
winecfg

# Lutris Telepito Linux Gaming Alkalmazas
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt update
sudo apt install lutris -y


# Felugro ablak ujrainditashoz NE TEGYEL SEHOVA #-et!
zenity --question --text='Ujrainditas 10 masodperc mulva?' --width='300' --height='100'
if [ $? = 0 ]; then

(
echo "0" ; 
echo "# Ujrainditas: 10" ; sleep 1
echo "10" ; 
echo "# Ujrainditas: 9" ; sleep 1
echo "20" ; 
echo "# Ujrainditas: 8" ; sleep 1
echo "30" ; 
echo "# Ujrainditas: 7" ; sleep 1
echo "40" ; 
echo "# Ujrainditas: 6" ; sleep 1
echo "50" ; 
echo "# Ujrainditas: 5" ; sleep 1
echo "60" ; 
echo "# Ujrainditas: 4" ; sleep 1
echo "70" ; 
echo "# Ujrainditas: 3" ; sleep 1
echo "80" ; 
echo "# Ujrainditas: 2" ; sleep 1
echo "90" ; 
echo "# Ujrainditas: 1" ; sleep 1
) |
zenity --progress \
  --title="Minden Frissites Telepitve" --width='300' \
  --text="Ujrainditas" \
  --auto-close \
  --no-cancel
  sudo reboot;
  
fi

if [ $? = 1 ]; then

	exit 0;
fi
