#!/bin/bash
# Intro
# -------------
clear
echo "------------------------------------------------------------------"
echo "Welcome to version 2.0 of the FIS"
distro="$(cat /etc/os-release | awk -F "\"" '/PRETTY_NAME/ {print $2}')"
echo "Welcome to your fresh" "${distro}"
echo "------------------------------------------------------------------"
sleep 2
clear

# Updating
# -------------
echo "--------------------------------------------"
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "--------------------------------------------"
sudo apt update
sleep 2
clear

# Upgrading
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sudo -k apt upgrade
sleep 2
clear

echo "--------------------------------"
echo "Mounting your ExtraDrive1"
echo "--------------------------------"

sudo mount /media/$uservar/ExtraDrive1
sudo mount /dev/sda1 /media/$uservar/ExtraDrive1

echo "---------------------------------"
echo "Restoring files from ExtraDrive1"
echo "---------------------------------"

# Setting username for path logic
read -p 'Username: ' uservar
clear

# Setting location
read -p 'Mount: ' mountvar
clear

tar -xzvf /media/$uservar/ExtraDrive1/Backups/Pictures.tar.gz
cp -r home/aaronhoneycutt/Pictures/* /home/$uservar/Pictures/

tar -xzvf /media/$uservar/ExtraDrive1/Backups/Documents.tar.gz
cp -r home/aaronhoneycutt/Documents/* /home/$uservar/Documents/

tar -xzvf /media/$uservar/ExtraDrive1/Backups/config-files.tar.gz 
cp -r home/aaronhoneycutt/.config/* /home/$uservar/.config/

echo "---------------------------------------------"
echo "Would you like to install some applications?"
echo "#1 will exit the script and #2 will continue"
echo "---------------------------------------------"
echo -n "Enter choice: "; read appchoice
case "$appchoice" in
1) exit 1
    ;;
2) echo "Continuing";;
 esac
 sleep 1
 clear
 
# Communication Tools
# --------------------
echo "-------------------------------"
echo "Install your communication tools of choice"
echo ""
echo "[1] Telegram"
echo "[0] Next"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read commoption
case "$commoption" in
1) sudo apt install telegram-desktop
   ;;
*) echo "Next option";;
esac
sleep 1
clear

# Graphics selection
# -------------------
echo "-------------------------------"
echo "Install your graphics software of choice"
echo ""
echo "[1] GIMP"
echo "[2] Inkscape"
echo "[3] All"
echo "[0] Next"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read graphicoption
case "$graphicoption" in
1) sudo apt install gimp
   ;;
2) sudo apt install inkscape
   ;;
3) sudo apt install gimp inkscape
   ;;
*) echo "Next option";;
esac
sleep 1
clear

echo "---------------------------------------------"
echo "Would you like to install development tools?"
echo "#1 will exit the script and #2 will continue"
echo "---------------------------------------------"
echo -n "Enter choice: "; read devchoice
case "$devchoice" in
1) exit 1
    ;;
2) echo "Continuing";;
 esac
 sleep 1
 clear

# Random useful tools
# -------------------
echo "-------------------------------"
echo "Installing some tools"
echo ""
echo "(gcc, make, g++, libncurses5), and Chrome"
echo "-------------------------------"
echo ""
sudo apt install gcc make g++ libncurses5-dev

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Fixing dep issues
# and removing old packages
# --------------------------
echo "-------------------------------------"
echo "Now let's clean up some dependencies"
echo "and some left over files"
echo "-------------------------------------"
echo ""
sudo apt -f install
sudo apt autoremove
rm google-chrome-stable_current_amd64.deb
clear

echo "---------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "---------------------------------"


